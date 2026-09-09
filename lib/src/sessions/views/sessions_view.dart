import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:protrack_golf/app/injector.dart';
import 'package:protrack_golf/app/router/app_routes.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/locations/locations.dart';
import 'package:protrack_golf/src/sessions/bloc/sessions_bloc.dart';
import 'package:protrack_golf/src/sessions/widgets/widgets.dart';

/// The Range tab - the app's home: a this-month summary and the list of
/// past practice sessions, newest first.
class SessionsView extends StatelessWidget {
  const SessionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<SessionsBloc>()..add(const SessionsRequested()),
        ),
        BlocProvider(
          create: (_) =>
              getIt<LocationsBloc>()..add(const LocationsRequested()),
        ),
      ],
      child: const _SessionsScaffold(),
    );
  }
}

class _SessionsScaffold extends StatelessWidget {
  const _SessionsScaffold();

  /// Opens a screen that may create a session, then reloads the list on
  /// return so it never goes stale.
  Future<void> _openAndRefresh(BuildContext context, String route) async {
    await context.push(route);
    if (context.mounted) {
      context.read<SessionsBloc>().add(const SessionsRequested());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionsBloc, SessionsState>(
      builder: (context, sessionsState) {
        final hasSessions = sessionsState.status is AppStatusSuccess;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Range'),
            actions: [
              IconButton(
                tooltip: 'Add manually',
                icon: const Icon(Icons.edit_note_outlined),
                onPressed: () =>
                    _openAndRefresh(context, SessionsRoutes.newSession),
              ),
              IconButton(
                tooltip: 'Locations',
                icon: const Icon(Icons.location_on_outlined),
                onPressed: () => context.push(LocationsRoutes.list),
              ),
            ],
          ),
          // The empty state carries its own call to action, so the FAB only
          // appears once there is a list for it to float over.
          floatingActionButton: hasSessions
              ? FloatingActionButton.extended(
                  onPressed: () =>
                      _openAndRefresh(context, SessionsRoutes.rangeLogger),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Start range session'),
                )
              : null,
          body: switch (sessionsState.status) {
            AppStatusInitial() || AppStatusLoading() => const LoadingView(),
            AppStatusFailure(:final failure) => ErrorView(
              message: failure.message,
              onRetry: () =>
                  context.read<SessionsBloc>().add(const SessionsRequested()),
            ),
            AppStatusEmpty() => _WelcomeHero(
              onStart: () =>
                  _openAndRefresh(context, SessionsRoutes.rangeLogger),
              onAddManually: () =>
                  _openAndRefresh(context, SessionsRoutes.newSession),
            ),
            AppStatusSuccess() => _SessionsList(state: sessionsState),
          },
        );
      },
    );
  }
}

class _SessionsList extends StatelessWidget {
  const _SessionsList({required this.state});

  final SessionsState state;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final total = state.sessions.length;
    return BlocBuilder<LocationsBloc, LocationsState>(
      builder: (context, locationsState) {
        final locationsById = {
          for (final location in locationsState.locations)
            location.id: location.name,
        };
        return ListView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.md,
            AppSpacing.sm,
            AppSpacing.md,
            AppSpacing.xxl * 2,
          ),
          children: [
            RangeOverviewCard(
              sessionsThisMonth: state.sessionsInMonth(now).length,
              shotsThisMonth: state.shotsInMonth(now),
              lastSessionDate: state.latestSession?.date,
            ),
            const SizedBox(height: AppSpacing.lg),
            SectionHeader(
              'Recent sessions  ·  $total',
            ),
            for (final session in state.sessions)
              SessionTile(
                session: session,
                locationName:
                    locationsById[session.locationId] ?? 'Unknown location',
                onTap: () => context.push(SessionsRoutes.detail(session.id)),
                onDelete: () => context.read<SessionsBloc>().add(
                  SessionDeleted(session.id),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _WelcomeHero extends StatelessWidget {
  const _WelcomeHero({required this.onStart, required this.onAddManually});

  final VoidCallback onStart;
  final VoidCallback onAddManually;

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
                  Icons.sports_golf,
                  color: AppColors.white,
                  size: AppSpacing.xxl,
                ),
                const SizedBox(height: AppSpacing.md),
                Text(
                  'Track your golf like a pro',
                  style: AppTypography.textTheme.labelMedium?.copyWith(
                    color: AppColors.sandGoldLight,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  'Welcome to the range',
                  style: AppTypography.textTheme.headlineMedium?.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'Record each ball as you hit it. Your club distances, '
                  'best shots, and progress build themselves from there.',
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
                    onPressed: onStart,
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Start range session'),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        const SectionHeader('Already been to the range?'),
        Text(
          'Add a past session by hand - clubs, distances, and notes.',
          style: AppTypography.textTheme.bodyMedium,
        ),
        const SizedBox(height: AppSpacing.sm),
        SecondaryButton(
          label: 'Add manually',
          icon: Icons.edit_note_outlined,
          onPressed: onAddManually,
        ),
      ],
    );
  }
}
