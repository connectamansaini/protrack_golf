import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protrack_golf/app/injector.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/locations/bloc/locations_bloc.dart';
import 'package:protrack_golf/src/locations/entities/location.dart';
import 'package:protrack_golf/src/locations/widgets/widgets.dart';
import 'package:protrack_golf/src/sessions/bloc/sessions_bloc.dart';
import 'package:protrack_golf/src/sessions/entities/practice_session.dart';

/// Full-screen list of reusable practice locations, each with how much
/// practice has happened there, plus add/delete.
class LocationsView extends StatelessWidget {
  const LocationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              getIt<LocationsBloc>()..add(const LocationsRequested()),
        ),
        // Sessions are read alongside so each location can show its usage;
        // the locations feature itself stays unaware of sessions.
        BlocProvider(
          create: (_) => getIt<SessionsBloc>()..add(const SessionsRequested()),
        ),
      ],
      child: const _LocationsScaffold(),
    );
  }
}

/// Per-location usage derived from the session list.
class _LocationUsage {
  const _LocationUsage({
    this.sessionCount = 0,
    this.shotCount = 0,
    this.lastVisit,
  });

  final int sessionCount;
  final int shotCount;
  final DateTime? lastVisit;

  static const none = _LocationUsage();

  static Map<String, _LocationUsage> fromSessions(
    List<PracticeSession> sessions,
  ) {
    final usage = <String, _LocationUsage>{};
    for (final session in sessions) {
      final current = usage[session.locationId] ?? none;
      final last = current.lastVisit;
      usage[session.locationId] = _LocationUsage(
        sessionCount: current.sessionCount + 1,
        shotCount: current.shotCount + session.totalShots,
        lastVisit: last == null || session.date.isAfter(last)
            ? session.date
            : last,
      );
    }
    return usage;
  }
}

class _LocationsScaffold extends StatelessWidget {
  const _LocationsScaffold();

  void _addLocation(BuildContext context) => AddLocationDialog.show(
    context,
    onSubmit: (name, notes) => context.read<LocationsBloc>().add(
      LocationAdded(name: name, notes: notes),
    ),
  );

  Future<void> _confirmDelete(
    BuildContext context,
    Location location,
    _LocationUsage usage,
  ) async {
    final bloc = context.read<LocationsBloc>();
    final sessions = usage.sessionCount;
    final delete = await ConfirmDialog.show(
      context,
      title: 'Delete ${location.name}?',
      message: sessions == 0
          ? 'This location has no sessions and will be removed.'
          : '$sessions session${sessions == 1 ? '' : 's'} recorded here '
                'will be kept, but will show "Unknown location".',
      confirmLabel: 'Delete',
      icon: Icons.location_off_outlined,
    );
    if (delete) bloc.add(LocationDeleted(location.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Locations')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _addLocation(context),
        icon: const Icon(Icons.add_location_alt_outlined),
        label: const Text('Add location'),
      ),
      body: BlocBuilder<LocationsBloc, LocationsState>(
        builder: (context, state) {
          return switch (state.status) {
            AppStatusInitial() || AppStatusLoading() => const LoadingView(),
            AppStatusFailure(:final failure) => ErrorView(
              message: failure.message,
              onRetry: () =>
                  context.read<LocationsBloc>().add(const LocationsRequested()),
            ),
            AppStatusEmpty() => _NoLocationsYet(
              onAdd: () => _addLocation(context),
            ),
            AppStatusSuccess() => BlocBuilder<SessionsBloc, SessionsState>(
              builder: (context, sessionsState) {
                final usageById = _LocationUsage.fromSessions(
                  sessionsState.sessions,
                );
                final count = state.locations.length;
                return ListView(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.md,
                    AppSpacing.sm,
                    AppSpacing.md,
                    AppSpacing.xxl * 2,
                  ),
                  children: [
                    Text(
                      'The ranges you practise at. Every session is tagged '
                      'with one, so you can compare how you hit at each.',
                      style: AppTypography.textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    SectionHeader(
                      '$count location${count == 1 ? '' : 's'}',
                    ),
                    for (final location in state.locations)
                      LocationTile(
                        location: location,
                        sessionCount:
                            (usageById[location.id] ?? _LocationUsage.none)
                                .sessionCount,
                        shotCount:
                            (usageById[location.id] ?? _LocationUsage.none)
                                .shotCount,
                        lastVisit: usageById[location.id]?.lastVisit,
                        onDelete: () => _confirmDelete(
                          context,
                          location,
                          usageById[location.id] ?? _LocationUsage.none,
                        ),
                      ),
                  ],
                );
              },
            ),
          };
        },
      ),
    );
  }
}

class _NoLocationsYet extends StatelessWidget {
  const _NoLocationsYet({required this.onAdd});

  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.fairwayGreen,
            borderRadius: BorderRadius.circular(AppRadii.lg),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: AppColors.white,
                  size: AppSpacing.xxl,
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  'Where do you practise?',
                  style: AppTypography.textTheme.headlineMedium?.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'Add the ranges you visit. Each session gets tagged with '
                  'one, so you can see where you hit it best.',
                  style: AppTypography.textTheme.bodyLarge?.copyWith(
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                SizedBox(
                  height: AppSpacing.tapTarget + AppSpacing.xs,
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.white,
                      foregroundColor: AppColors.fairwayGreen,
                    ),
                    onPressed: onAdd,
                    icon: const Icon(Icons.add_location_alt_outlined),
                    label: const Text('Add your first range'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
