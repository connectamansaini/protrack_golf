import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:protrack_golf/app/injector.dart';
import 'package:protrack_golf/app/router/app_routes.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/locations/locations.dart';
import 'package:protrack_golf/src/sessions/bloc/range_logger_bloc.dart';
import 'package:protrack_golf/src/sessions/helpers/range_logger_step.dart';
import 'package:protrack_golf/src/sessions/widgets/widgets.dart';

/// The shot-by-shot range logger: a quick setup step (where, how many
/// balls), then a big balls-remaining counter, club quick-picks, and one
/// "Log shot" tap per ball. Finishing saves a regular `PracticeSession` and
/// opens its recap.
class RangeLoggerView extends StatelessWidget {
  const RangeLoggerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<RangeLoggerBloc>()..add(const RangeLoggerStarted()),
      child: const _RangeLoggerScaffold(),
    );
  }
}

class _RangeLoggerScaffold extends StatelessWidget {
  const _RangeLoggerScaffold();

  Future<void> _confirmDiscard(BuildContext context) async {
    final discard = await ConfirmDialog.show(
      context,
      title: 'Discard this session?',
      message:
          'The shots you recorded will be lost. Use Finish instead to keep '
          'them.',
      confirmLabel: 'Discard',
      cancelLabel: 'Keep going',
      icon: Icons.delete_sweep_outlined,
    );
    if (discard && context.mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RangeLoggerBloc, RangeLoggerState>(
      listenWhen: (previous, current) =>
          previous.submitStatus != current.submitStatus,
      listener: (context, state) {
        switch (state.submitStatus) {
          case AppStatusSuccess():
            final saved = state.savedSession;
            if (saved != null) {
              // `go` (not push) so the Log tab is rebuilt fresh - and so
              // reloads its list - when the recap's "Done" sends the golfer
              // back to it.
              context.go(SessionsRoutes.recap(saved.id));
            }
          case AppStatusFailure(:final failure):
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(failure.message)));
          default:
            break;
        }
      },
      builder: (context, state) {
        final submitting = state.submitStatus is AppStatusLoading;
        return PopScope(
          canPop: state.shots.isEmpty,
          onPopInvokedWithResult: (didPop, _) {
            if (!didPop) unawaited(_confirmDiscard(context));
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                state.step == RangeLoggerStep.setup
                    ? 'Start range session'
                    : 'Range session',
              ),
              actions: [
                if (state.step == RangeLoggerStep.logging)
                  Padding(
                    padding: const EdgeInsets.only(right: AppSpacing.xs),
                    child: TextButton.icon(
                      onPressed: (!state.canFinish || submitting)
                          ? null
                          : () => context.read<RangeLoggerBloc>().add(
                              const RangeLoggerFinished(),
                            ),
                      icon: const Icon(Icons.flag_outlined),
                      label: Text(submitting ? 'Saving...' : 'Finish'),
                    ),
                  ),
              ],
            ),
            bottomNavigationBar: state.step == RangeLoggerStep.setup
                ? _SetupBottomBar(state: state)
                : null, // Floating so the next shot is always one tap away, wherever
            // the golfer has scrolled to.
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: state.step == RangeLoggerStep.logging
                ? FloatingActionButton.extended(
                    onPressed: submitting
                        ? null
                        : () => context.read<RangeLoggerBloc>().add(
                            RangeLoggerShotLogged(
                              state.pendingDistanceYds.toDouble(),
                            ),
                          ),
                    icon: const Icon(Icons.add),
                    label: Text(
                      'Add ${state.selectedClub.label} shot  ·  '
                      '${state.pendingDistanceYds} yds',
                    ),
                  )
                : null,
            body: switch (state.step) {
              RangeLoggerStep.setup => _SetupStep(state: state),
              RangeLoggerStep.logging => _LoggingStep(state: state),
            },
          ),
        );
      },
    );
  }
}

class _SetupStep extends StatelessWidget {
  const _SetupStep({required this.state});

  final RangeLoggerState state;

  String get _locationSummary =>
      state.availableLocations
          .where((l) => l.id == state.selectedLocationId)
          .map((l) => l.name)
          .firstOrNull ??
      'Not set';

  String get _clubsSummary {
    final count = state.sessionClubs.length;
    return count == 0 ? 'None yet' : '$count club${count == 1 ? '' : 's'}';
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RangeLoggerBloc>();
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.sm,
        AppSpacing.md,
        AppSpacing.lg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Three quick choices, then it is one tap per ball.',
            style: AppTypography.textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          StepCard(
            number: 1,
            title: 'Where are you?',
            summary: _locationSummary,
            done: state.selectedLocationId.isNotEmpty,
            child: LocationChips(
              locations: state.availableLocations,
              selectedId: state.selectedLocationId,
              onSelected: (id) => bloc.add(RangeLoggerLocationSelected(id)),
              onAddNew: () => AddLocationDialog.show(
                context,
                onSubmit: (name, notes) => bloc.add(
                  RangeLoggerLocationAdded(name: name, notes: notes),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          StepCard(
            number: 2,
            title: 'Clubs for today',
            summary: _clubsSummary,
            done: state.sessionClubs.isNotEmpty,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: AppSpacing.xs,
                  runSpacing: AppSpacing.xs,
                  children: [
                    ActionChip(
                      avatar: const Icon(Icons.history, size: AppSpacing.md),
                      label: const Text('Same as last time'),
                      onPressed: state.lastSessionClubs.isEmpty
                          ? null
                          : () => bloc.add(const RangeLoggerLastClubsApplied()),
                    ),
                    ActionChip(
                      avatar: const Icon(Icons.clear, size: AppSpacing.md),
                      label: const Text('Clear'),
                      onPressed: state.sessionClubs.isEmpty
                          ? null
                          : () => bloc.add(const RangeLoggerClubsCleared()),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.xs),
                ClubMultiPicker(
                  selected: state.sessionClubs,
                  onToggled: (club) => bloc.add(RangeLoggerClubToggled(club)),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          StepCard(
            number: 3,
            title: 'Bucket size',
            summary: '${state.bucketSize} balls',
            done: state.bucketSize > 0,
            child: BucketSizePicker(
              bucketSize: state.bucketSize,
              onChanged: (size) => bloc.add(RangeLoggerBucketSizeChanged(size)),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoggingStep extends StatefulWidget {
  const _LoggingStep({required this.state});

  final RangeLoggerState state;

  @override
  State<_LoggingStep> createState() => _LoggingStepState();
}

class _LoggingStepState extends State<_LoggingStep> {
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _editClubs(BuildContext context) {
    final bloc = context.read<RangeLoggerBloc>();
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => BlocProvider.value(
        value: bloc,
        child: BlocBuilder<RangeLoggerBloc, RangeLoggerState>(
          builder: (context, state) => SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Container(
                        width: AppSpacing.xxl,
                        height: AppSpacing.xxl,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: AppColors.fairwayGreenTint,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.tune,
                          color: AppColors.fairwayGreen,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Clubs for this session',
                              style: AppTypography.textTheme.headlineSmall,
                            ),
                            Text(
                              'Tap to add or remove. Shots already recorded '
                              'are kept.',
                              style: AppTypography.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  ClubMultiPicker(
                    selected: state.sessionClubs,
                    onToggled: (club) => context.read<RangeLoggerBloc>().add(
                      RangeLoggerClubToggled(club),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  PrimaryButton(
                    label: 'Done',
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    final notInSession = {
      for (final club in GolfClub.values)
        if (!state.sessionClubs.contains(club)) club,
    };
    return SingleChildScrollView(
      // Extra bottom room so the floating "Add shot" button never covers
      // the notes field or the finish button.
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.md,
        AppSpacing.md,
        AppSpacing.xxl * 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BallsRemainingCounter(
            remaining: state.ballsRemaining,
            hit: state.shotCount,
            bucketSize: state.bucketSize,
            currentClubLabel: state.selectedClub.label,
            currentClubShots: state.selectedClubShots,
            currentClubAverageYds: state.selectedClubAverageYds,
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            children: [
              const Expanded(child: SectionHeader('Club')),
              TextButton.icon(
                onPressed: () => _editClubs(context),
                icon: const Icon(Icons.tune),
                label: const Text('Edit clubs'),
              ),
            ],
          ),
          ClubQuickPicker(
            selected: state.selectedClub,
            hidden: notInSession,
            counts: state.shotCountsByClub,
            onSelected: (club) => context.read<RangeLoggerBloc>().add(
              RangeLoggerClubSelected(club),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          const SectionHeader('Distance'),
          DistanceSlider(
            distanceYds: state.pendingDistanceYds,
            onChanged: (value) => context.read<RangeLoggerBloc>().add(
              RangeLoggerDistanceChanged(value),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          RecentShotsList(
            shots: state.shots,
            onUndo: () => context.read<RangeLoggerBloc>().add(
              const RangeLoggerLastShotUndone(),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          const SectionHeader('Notes (optional)'),
          TextField(
            controller: _notesController,
            maxLines: 2,
            decoration: const InputDecoration(
              hintText: 'How did the session go?',
            ),
            onChanged: (value) => context.read<RangeLoggerBloc>().add(
              RangeLoggerNotesChanged(value),
            ),
          ),
        ],
      ),
    );
  }
}

/// Pinned under the setup step: what has been chosen so far and the button
/// that starts the session, so nothing needs scrolling to reach.
class _SetupBottomBar extends StatelessWidget {
  const _SetupBottomBar({required this.state});

  final RangeLoggerState state;

  String get _summary {
    if (state.selectedLocationId.isEmpty) return 'Pick a location to start.';
    if (state.sessionClubs.isEmpty) return 'Pick at least one club.';
    final clubs = state.sessionClubs.length;
    return '${state.bucketSize} balls  ·  $clubs club${clubs == 1 ? '' : 's'}';
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(
          top: BorderSide(color: AppColors.border, width: AppStrokes.thin),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.md,
            AppSpacing.sm,
            AppSpacing.md,
            AppSpacing.sm,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                _summary,
                textAlign: TextAlign.center,
                style: AppTypography.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              SizedBox(
                height: AppSpacing.tapTarget + AppSpacing.xs,
                child: PrimaryButton(
                  label: 'Start hitting',
                  icon: Icons.play_arrow,
                  onPressed: state.canStartLogging
                      ? () => context.read<RangeLoggerBloc>().add(
                          const RangeLoggerSetupCompleted(),
                        )
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
