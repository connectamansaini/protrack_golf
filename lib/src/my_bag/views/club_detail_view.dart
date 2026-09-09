import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:protrack_golf/app/injector.dart';
import 'package:protrack_golf/app/router/app_routes.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/my_bag/bloc/club_detail_bloc.dart';
import 'package:protrack_golf/src/my_bag/widgets/widgets.dart';

/// Detail screen for one club: a hero with its numbers (including the
/// distance the golfer entered by hand, when set), a distance trend chart
/// across sessions, and the sessions it was hit in.
class ClubDetailView extends StatelessWidget {
  const ClubDetailView({required this.club, super.key});

  final GolfClub club;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ClubDetailBloc>()..add(ClubDetailRequested(club)),
      child: _ClubDetailScaffold(club: club),
    );
  }
}

class _ClubDetailScaffold extends StatelessWidget {
  const _ClubDetailScaffold({required this.club});

  final GolfClub club;

  /// Opens the distance sheet locked to this club; saving goes through the
  /// bloc, which reloads the screen.
  Future<void> _editDistance(BuildContext context, ClubDetailState state) {
    final bloc = context.read<ClubDetailBloc>();
    return AddClubSheet.show(
      context,
      initialClub: club,
      initialDistanceYds: state.record.manualDistanceYds,
      lockClub: true,
      onSave: (_, distanceYds) =>
          bloc.add(ClubDetailDistanceSaved(distanceYds)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClubDetailBloc, ClubDetailState>(
      builder: (context, state) {
        final inBag = state.record.inBag;
        return Scaffold(
          appBar: AppBar(
            title: Text(club.label),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: AppSpacing.xs),
                child: TextButton.icon(
                  onPressed: () => _editDistance(context, state),
                  icon: Icon(inBag ? Icons.edit_outlined : Icons.add),
                  label: Text(inBag ? 'Edit distance' : 'Add to bag'),
                ),
              ),
            ],
          ),
          body: switch (state.status) {
            AppStatusInitial() || AppStatusLoading() => const LoadingView(),
            AppStatusFailure(:final failure) => ErrorView(
              message: failure.message,
              onRetry: () =>
                  context.read<ClubDetailBloc>().add(ClubDetailRequested(club)),
            ),
            AppStatusEmpty() => _NotTrackedYet(
              club: club,
              onAddToBag: () => _editDistance(context, state),
            ),
            AppStatusSuccess() => _ClubDetailBody(state: state),
          },
        );
      },
    );
  }
}

class _ClubDetailBody extends StatelessWidget {
  const _ClubDetailBody({required this.state});

  final ClubDetailState state;

  @override
  Widget build(BuildContext context) {
    final hasShots = state.record.hasSessionData;
    final hasTrend = state.trend.dataPoints.length >= 2;
    final sessions = state.history.reversed.toList();
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        ClubDetailHero(record: state.record, trend: state.trend),
        const SizedBox(height: AppSpacing.lg),
        const SectionHeader('Average distance over time'),
        if (!hasShots)
          const _Hint(
            icon: Icons.sports_golf_outlined,
            text:
                'No range shots with this club yet. Start a range session '
                'and its averages will show up here.',
          )
        else ...[
          ClubTrendChart(trend: state.trend),
          if (!hasTrend) ...[
            const SizedBox(height: AppSpacing.xs),
            const _Hint(
              icon: Icons.timeline,
              text: 'Hit another session with this club to see a trend.',
            ),
          ],
        ],
        if (hasShots) ...[
          const SizedBox(height: AppSpacing.lg),
          SectionHeader('Sessions with this club  ·  ${sessions.length}'),
          for (final summary in sessions)
            ClubSessionSummaryTile(
              summary: summary,
              onTap: () =>
                  context.push(SessionsRoutes.detail(summary.sessionId)),
            ),
        ],
        const SizedBox(height: AppSpacing.lg),
      ],
    );
  }
}

class _Hint extends StatelessWidget {
  const _Hint({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: AppSpacing.md, color: AppColors.textSecondary),
        const SizedBox(width: AppSpacing.xs),
        Expanded(
          child: Text(text, style: AppTypography.textTheme.bodySmall),
        ),
      ],
    );
  }
}

class _NotTrackedYet extends StatelessWidget {
  const _NotTrackedYet({required this.club, required this.onAddToBag});

  final GolfClub club;
  final VoidCallback onAddToBag;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        EmptyView(
          message:
              'Your ${club.label} is not in your bag and has no logged shots '
              'yet.',
          icon: Icons.sports_golf_outlined,
        ),
        PrimaryButton(
          label: 'Add ${club.label} to bag',
          icon: Icons.add,
          onPressed: onAddToBag,
        ),
      ],
    );
  }
}
