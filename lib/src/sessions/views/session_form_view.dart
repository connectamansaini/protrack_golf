import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:protrack_golf/app/injector.dart';
import 'package:protrack_golf/core/core.dart';
import 'package:protrack_golf/src/locations/locations.dart';
import 'package:protrack_golf/src/sessions/bloc/session_form_bloc.dart';
import 'package:protrack_golf/src/sessions/media_storage_service.dart';
import 'package:protrack_golf/src/sessions/widgets/widgets.dart';

/// The "add a past practice session by hand" form: when and where, bucket
/// size, club entries built shot by shot, then notes and optional photos.
class SessionFormView extends StatelessWidget {
  const SessionFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SessionFormBloc>()..add(const SessionFormStarted()),
      child: const _SessionFormScaffold(),
    );
  }
}

class _SessionFormScaffold extends StatefulWidget {
  const _SessionFormScaffold();

  @override
  State<_SessionFormScaffold> createState() => _SessionFormScaffoldState();
}

class _SessionFormScaffoldState extends State<_SessionFormScaffold> {
  final _mediaStorage = const MediaStorageService();
  final _picker = ImagePicker();
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _pickPhoto(BuildContext context) async {
    final file = await _picker.pickImage(source: ImageSource.gallery);
    if (file == null || !context.mounted) return;
    final path = await _mediaStorage.persist(file);
    if (!context.mounted) return;
    context.read<SessionFormBloc>().add(SessionFormMediaAdded(path));
  }

  Future<void> _pickVideo(BuildContext context) async {
    final file = await _picker.pickVideo(source: ImageSource.gallery);
    if (file == null || !context.mounted) return;
    final path = await _mediaStorage.persist(file);
    if (!context.mounted) return;
    context.read<SessionFormBloc>().add(SessionFormMediaAdded(path));
  }

  Future<void> _pickDate(BuildContext context, DateTime current) async {
    final bloc = context.read<SessionFormBloc>();
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: current,
      firstDate: DateTime(now.year - 5),
      lastDate: now,
    );
    if (picked != null) bloc.add(SessionFormDateChanged(picked));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SessionFormBloc, SessionFormState>(
      listenWhen: (previous, current) =>
          previous.submitStatus != current.submitStatus,
      listener: (context, state) {
        switch (state.submitStatus) {
          case AppStatusSuccess():
            Navigator.of(context).pop();
          case AppStatusFailure(:final failure):
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(failure.message)));
          default:
            break;
        }
      },
      builder: (context, state) {
        final bloc = context.read<SessionFormBloc>();
        final submitting = state.submitStatus is AppStatusLoading;
        final date = state.date ?? DateTime.now();
        final locationName = state.availableLocations
            .where((l) => l.id == state.selectedLocationId)
            .map((l) => l.name)
            .firstOrNull;
        final clubCount = state.clubEntries.length;
        return Scaffold(
          appBar: AppBar(title: const Text('Add past session')),
          bottomNavigationBar: _SaveBar(
            summary: state.selectedLocationId.isEmpty
                ? 'Pick a location to save.'
                : clubCount == 0
                ? 'Add at least one club entry.'
                : '${DateFormatter.shortDate(date)}  ·  $locationName  ·  '
                      '$clubCount club${clubCount == 1 ? '' : 's'}',
            saving: submitting,
            onSave: (!state.canSubmit || submitting)
                ? null
                : () => bloc.add(const SessionFormSubmitted()),
          ),
          body: SingleChildScrollView(
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
                  'Been to the range without the app? Rebuild the session '
                  'here so it counts.',
                  style: AppTypography.textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                StepCard(
                  number: 1,
                  title: 'When and where',
                  summary: locationName == null
                      ? DateFormatter.shortDate(date)
                      : '${DateFormatter.shortDate(date)} · $locationName',
                  done: state.selectedLocationId.isNotEmpty,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _DateChips(
                        date: date,
                        onChanged: (value) =>
                            bloc.add(SessionFormDateChanged(value)),
                        onPick: () => _pickDate(context, date),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      LocationChips(
                        locations: state.availableLocations,
                        selectedId: state.selectedLocationId,
                        onSelected: (id) =>
                            bloc.add(SessionFormLocationSelected(id)),
                        onAddNew: () => AddLocationDialog.show(
                          context,
                          onSubmit: (name, notes) => bloc.add(
                            SessionFormLocationAdded(name: name, notes: notes),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                StepCard(
                  number: 2,
                  title: 'Bucket size',
                  summary: '${state.bucketSize} balls',
                  done: state.bucketSize > 0,
                  child: BucketSizePicker(
                    bucketSize: state.bucketSize,
                    onChanged: (size) =>
                        bloc.add(SessionFormBucketSizeChanged(size)),
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                StepCard(
                  number: 3,
                  title: 'Clubs and shots',
                  summary: clubCount == 0
                      ? 'None yet'
                      : '$clubCount club${clubCount == 1 ? '' : 's'}',
                  done: clubCount > 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (var i = 0; i < state.clubEntries.length; i++)
                        ClubEntryTile(
                          entry: state.clubEntries[i],
                          onRemove: () =>
                              bloc.add(SessionFormClubEntryRemoved(i)),
                        ),
                      ClubEntryForm(
                        onAdd: (entry) =>
                            bloc.add(SessionFormClubEntryAdded(entry)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                const SectionHeader('Notes (optional)'),
                TextFormField(
                  controller: _notesController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    hintText: 'How did the session go overall?',
                  ),
                  onChanged: (value) =>
                      bloc.add(SessionFormNotesChanged(value)),
                ),
                const SizedBox(height: AppSpacing.lg),
                const SectionHeader('Photos / videos (optional)'),
                MediaAttachmentRow(
                  mediaPaths: state.mediaPaths,
                  onAddPhoto: () => _pickPhoto(context),
                  onAddVideo: () => _pickVideo(context),
                  onRemove: (path) => bloc.add(SessionFormMediaRemoved(path)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Today / Yesterday shortcuts plus a calendar for anything older.
class _DateChips extends StatelessWidget {
  const _DateChips({
    required this.date,
    required this.onChanged,
    required this.onPick,
  });

  final DateTime date;
  final ValueChanged<DateTime> onChanged;
  final VoidCallback onPick;

  static bool _sameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final isToday = _sameDay(date, today);
    final isYesterday = _sameDay(date, yesterday);
    return Wrap(
      spacing: AppSpacing.xs,
      runSpacing: AppSpacing.xs,
      children: [
        AppChoiceChip(
          label: 'Today',
          selected: isToday,
          onSelected: () => onChanged(today),
        ),
        AppChoiceChip(
          label: 'Yesterday',
          selected: isYesterday,
          onSelected: () => onChanged(yesterday),
        ),
        AppChoiceChip(
          label: isToday || isYesterday
              ? 'Pick a date'
              : DateFormatter.mediumDate(date),
          selected: !isToday && !isYesterday,
          onSelected: onPick,
        ),
      ],
    );
  }
}

/// Pinned save bar: what's been entered so far and the save button.
class _SaveBar extends StatelessWidget {
  const _SaveBar({
    required this.summary,
    required this.saving,
    required this.onSave,
  });

  final String summary;
  final bool saving;
  final VoidCallback? onSave;

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
                summary,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              SizedBox(
                height: AppSpacing.tapTarget + AppSpacing.xs,
                child: PrimaryButton(
                  label: saving ? 'Saving...' : 'Save session',
                  icon: Icons.check,
                  onPressed: onSave,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
