import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:protrack_golf/app/injector.dart';
import 'package:protrack_golf/app/router/app_routes.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/my_bag/bloc/my_bag_bloc.dart';
import 'package:protrack_golf/src/my_bag/entities/club_distance_record.dart';
import 'package:protrack_golf/src/my_bag/widgets/widgets.dart';

/// The My Bag tab: a bag illustration showing which club groups the golfer
/// owns, then a personal yardage chart with one card per club - merged from
/// clubs added by hand and shots logged at the range.
class MyBagView extends StatelessWidget {
  const MyBagView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<MyBagBloc>()..add(const MyBagRequested()),
      child: const _MyBagScaffold(),
    );
  }
}

class _MyBagScaffold extends StatelessWidget {
  const _MyBagScaffold();

  /// Opens the add/edit sheet. Saving dispatches through the bloc, which
  /// reloads the list itself, so nothing here can go stale.
  Future<void> _openClubSheet(
    BuildContext context, {
    GolfClub? initialClub,
    double initialDistanceYds = 0,
    bool lockClub = false,
  }) {
    final bloc = context.read<MyBagBloc>();
    return AddClubSheet.show(
      context,
      initialClub: initialClub,
      initialDistanceYds: initialDistanceYds,
      lockClub: lockClub,
      hiddenClubs: lockClub ? const {} : bloc.state.clubsInBag,
      onSave: (club, distanceYds) =>
          bloc.add(BagClubSaved(club: club, distanceYds: distanceYds)),
    );
  }

  /// The first club of [category] not yet in the bag, so tapping a head on
  /// the illustration lands on something addable.
  GolfClub? _firstAddable(MyBagState state, ClubCategory category) => GolfClub
      .values
      .where((c) => c.category == category && !state.clubsInBag.contains(c))
      .firstOrNull;

  Future<void> _confirmRemove(
    BuildContext context,
    ClubDistanceRecord record,
  ) async {
    final bloc = context.read<MyBagBloc>();
    final remove = await ConfirmDialog.show(
      context,
      title: 'Remove ${record.club.label} from your bag?',
      message:
          'Your entered distance will be forgotten. Range stats for this '
          'club are kept.',
      confirmLabel: 'Remove',
      icon: Icons.remove_circle_outline,
    );
    if (remove) bloc.add(BagClubRemoved(record.club));
  }

  /// Long-press menu: the same actions as the card's overflow icon, in a
  /// sheet that's easier to hit with a glove on.
  Future<void> _showCardActions(
    BuildContext context,
    ClubDistanceRecord record,
  ) async {
    final action = await showModalBottomSheet<_RecordAction>(
      context: context,
      builder: (sheetContext) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(
                record.club.label,
                style: AppTypography.textTheme.titleLarge,
              ),
            ),
            if (record.inBag) ...[
              ListTile(
                leading: const Icon(Icons.edit_outlined),
                title: const Text('Edit distance'),
                onTap: () =>
                    Navigator.of(sheetContext).pop(_RecordAction.editDistance),
              ),
              ListTile(
                leading: const Icon(Icons.remove_circle_outline),
                title: const Text('Remove from bag'),
                onTap: () =>
                    Navigator.of(sheetContext).pop(_RecordAction.removeFromBag),
              ),
            ] else
              ListTile(
                leading: const Icon(Icons.add_circle_outline),
                title: const Text('Add to bag'),
                onTap: () =>
                    Navigator.of(sheetContext).pop(_RecordAction.addToBag),
              ),
            const SizedBox(height: AppSpacing.xs),
          ],
        ),
      ),
    );
    if (action == null || !context.mounted) return;
    switch (action) {
      case _RecordAction.editDistance:
        await _openClubSheet(
          context,
          initialClub: record.club,
          initialDistanceYds: record.manualDistanceYds,
          lockClub: true,
        );
      case _RecordAction.removeFromBag:
        await _confirmRemove(context, record);
      case _RecordAction.addToBag:
        await _openClubSheet(context, initialClub: record.club, lockClub: true);
    }
  }

  Widget _illustration(BuildContext context, MyBagState state) => Padding(
    padding: const EdgeInsets.only(bottom: AppSpacing.lg),
    child: GolfBagIllustration(
      ownedCategories: state.ownedCategories,
      hasHybrid: state.hasHybrid,
      onCategoryTapped: (category) => _openClubSheet(
        context,
        initialClub: _firstAddable(state, category),
      ),
      onHybridTapped: () => _openClubSheet(
        context,
        initialClub: GolfClub.hybrid,
        initialDistanceYds: state.records
            .where((r) => r.club == GolfClub.hybrid)
            .map((r) => r.manualDistanceYds)
            .firstOrNull ?? 0,
        lockClub: state.hasHybrid,
      ),
    ),
  );

  Widget _card(BuildContext context, ClubDistanceRecord record) =>
      ClubDistanceCard(
        record: record,
        onTap: () => context.push(MyBagRoutes.club(record.club.name)),
        onLongPress: () => _showCardActions(context, record),
        onEditDistance: record.inBag
            ? () => _openClubSheet(
                context,
                initialClub: record.club,
                initialDistanceYds: record.manualDistanceYds,
                lockClub: true,
              )
            : null,
        onRemoveFromBag: record.inBag
            ? () => _confirmRemove(context, record)
            : null,
        onAddToBag: record.inBag
            ? null
            : () => _openClubSheet(
                context,
                initialClub: record.club,
                lockClub: true,
              ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyBagBloc, MyBagState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('My Bag')),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => _openClubSheet(context),
            icon: const Icon(Icons.add),
            label: const Text('Add club'),
          ),
          body: switch (state.status) {
            AppStatusInitial() || AppStatusLoading() => const LoadingView(),
            AppStatusFailure(:final failure) => ErrorView(
              message: failure.message,
              onRetry: () =>
                  context.read<MyBagBloc>().add(const MyBagRequested()),
            ),
            AppStatusEmpty() => ListView(
              padding: const EdgeInsets.all(AppSpacing.md),
              children: [
                _illustration(context, state),
                _BuildYourBagHero(onAddClub: () => _openClubSheet(context)),
              ],
            ),
            AppStatusSuccess() => ListView(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.md,
                AppSpacing.md,
                AppSpacing.xxl + AppSpacing.xl,
              ),
              children: [
                _illustration(context, state),
                _BagSummary(
                  clubsInBag: state.clubsInBag.length,
                  clubsWithRangeData: state.clubsWithRangeData,
                ),
                const SizedBox(height: AppSpacing.md),
                for (final entry in state.recordsByCategory.entries) ...[
                  SectionHeader(entry.key.label),
                  for (final record in entry.value) _card(context, record),
                  const SizedBox(height: AppSpacing.xs),
                ],
              ],
            ),
          },
        );
      },
    );
  }
}

/// Long-press menu choices for one yardage-chart card.
enum _RecordAction { editDistance, removeFromBag, addToBag }

/// One line under the illustration: how full the bag is and how much of it
/// is backed by real range shots.
class _BagSummary extends StatelessWidget {
  const _BagSummary({
    required this.clubsInBag,
    required this.clubsWithRangeData,
  });

  final int clubsInBag;
  final int clubsWithRangeData;

  @override
  Widget build(BuildContext context) {
    final parts = [
      '$clubsInBag club${clubsInBag == 1 ? '' : 's'} in bag',
      '$clubsWithRangeData with range data',
    ];
    return Row(
      children: [
        const Icon(
          Icons.backpack_outlined,
          size: AppSpacing.md,
          color: AppColors.textSecondary,
        ),
        const SizedBox(width: AppSpacing.xs),
        Expanded(
          child: Text(
            parts.join('  ·  '),
            style: AppTypography.textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}

/// The empty-bag call to action.
class _BuildYourBagHero extends StatelessWidget {
  const _BuildYourBagHero({required this.onAddClub});

  final VoidCallback onAddClub;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.fairwayGreen,
        borderRadius: BorderRadius.circular(AppRadii.lg),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Build your bag',
              style: AppTypography.textTheme.headlineMedium?.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Add the clubs you carry and how far you hit each one. Tap a '
              'group above to start, or let a range session fill it in '
              'from real shots.',
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
                onPressed: onAddClub,
                icon: const Icon(Icons.add),
                label: const Text('Add your first club'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
