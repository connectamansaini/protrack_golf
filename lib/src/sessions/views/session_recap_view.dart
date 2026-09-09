import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:protrack_golf/app/injector.dart';
import 'package:protrack_golf/app/router/app_routes.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/locations/locations.dart';
import 'package:protrack_golf/src/sessions/bloc/session_recap_bloc.dart';
import 'package:protrack_golf/src/sessions/widgets/widgets.dart';

/// Post-session recap: where/when/how many balls, then one card per club
/// comparing this session's average to the last time that club was hit.
class SessionRecapView extends StatelessWidget {
  const SessionRecapView({required this.sessionId, super.key});

  final String sessionId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              getIt<SessionRecapBloc>()..add(SessionRecapRequested(sessionId)),
        ),
        BlocProvider(
          create: (_) =>
              getIt<LocationsBloc>()..add(const LocationsRequested()),
        ),
      ],
      child: const _SessionRecapScaffold(),
    );
  }
}

class _SessionRecapScaffold extends StatelessWidget {
  const _SessionRecapScaffold();

  @override
  Widget build(BuildContext context) {
    // Reached by `go` straight after a range session (nothing beneath it) or
    // by `push` from the session detail; a hardware back should behave
    // sensibly either way.
    final canPop = context.canPop();
    return PopScope(
      canPop: canPop,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) context.go(SessionsRoutes.tab);
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Session recap')),
        body: BlocBuilder<SessionRecapBloc, SessionRecapState>(
          builder: (context, state) {
            switch (state.status) {
              case AppStatusInitial() || AppStatusLoading():
                return const LoadingView();
              case AppStatusFailure(:final failure):
                return ErrorView(message: failure.message);
              case AppStatusEmpty():
                return const EmptyView(
                  message: 'No shots were recorded in this session.',
                );
              case AppStatusSuccess():
                final recap = state.recap;
                if (recap == null) {
                  return const EmptyView(message: 'Session not found.');
                }
                return BlocBuilder<LocationsBloc, LocationsState>(
                  builder: (context, locationsState) {
                    final locationName = locationsState.locations
                        .where((l) => l.id == recap.session.locationId)
                        .map((l) => l.name)
                        .firstOrNull;
                    return ListView(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      children: [
                        RecapHeroCard(
                          recap: recap,
                          locationName: locationName ?? 'Unknown location',
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        const SectionHeader('By club'),
                        for (final clubRecap in recap.clubRecaps)
                          ClubRecapCard(recap: clubRecap),
                        if (recap.session.notes.isNotEmpty) ...[
                          const SizedBox(height: AppSpacing.md),
                          const SectionHeader('Notes'),
                          Text(
                            recap.session.notes,
                            style: AppTypography.textTheme.bodyMedium,
                          ),
                        ],
                        if (recap.recurringThemes.isNotEmpty) ...[
                          const SizedBox(height: AppSpacing.lg),
                          const SectionHeader('Recurring themes'),
                          RecurringThemesPanel(
                            themes: recap.recurringThemes,
                            windowSessions: recap.themeWindowSessions,
                          ),
                        ],
                        const SizedBox(height: AppSpacing.xl),
                        PrimaryButton(
                          label: 'Done',
                          icon: Icons.check,
                          onPressed: () => context.go(SessionsRoutes.tab),
                        ),
                        const SizedBox(height: AppSpacing.lg),
                      ],
                    );
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
