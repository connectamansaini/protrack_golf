import 'package:flutter/material.dart';
import 'package:protrack_golf/core/core.dart';

/// Bottom sheet for creating a new `Location`. Reports back the entered
/// values via [onSubmit] - it owns no persistence logic itself.
class AddLocationDialog extends StatefulWidget {
  const AddLocationDialog({required this.onSubmit, super.key});

  final void Function(String name, String notes) onSubmit;

  static Future<void> show(
    BuildContext context, {
    required void Function(String name, String notes) onSubmit,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => AddLocationDialog(onSubmit: onSubmit),
    );
  }

  @override
  State<AddLocationDialog> createState() => _AddLocationDialogState();
}

class _AddLocationDialogState extends State<AddLocationDialog> {
  final _nameController = TextEditingController();
  final _notesController = TextEditingController();
  final _notesFocus = FocusNode();

  bool get _canSave => _nameController.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _notesController.dispose();
    _notesFocus.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_canSave) return;
    widget.onSubmit(_nameController.text.trim(), _notesController.text.trim());
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Keep the fields and button above the keyboard.
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.sm,
          AppSpacing.md,
          AppSpacing.lg,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: AppSpacing.xxl,
                height: AppSpacing.xxs,
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(AppRadii.pill),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
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
                    Icons.add_location_alt_outlined,
                    color: AppColors.fairwayGreen,
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New location',
                        style: AppTypography.textTheme.headlineSmall,
                      ),
                      Text(
                        'A range you practise at. You only add it once.',
                        style: AppTypography.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            TextField(
              controller: _nameController,
              autofocus: true,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Name',
                hintText: 'e.g. Dwarka Golf Range',
              ),
              onSubmitted: (_) => _notesFocus.requestFocus(),
            ),
            const SizedBox(height: AppSpacing.sm),
            TextField(
              controller: _notesController,
              focusNode: _notesFocus,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                labelText: 'Notes (optional)',
                hintText: 'e.g. mats only, 250 yd range, cheap buckets',
              ),
              onSubmitted: (_) => _submit(),
            ),
            const SizedBox(height: AppSpacing.lg),
            SizedBox(
              height: AppSpacing.tapTarget + AppSpacing.xs,
              child: PrimaryButton(
                label: 'Save location',
                icon: Icons.check,
                onPressed: _canSave ? _submit : null,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}
