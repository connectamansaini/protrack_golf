import 'package:flutter/material.dart';
import 'package:protrack_golf/core/core.dart';

/// Shows attached media file names as removable chips, plus buttons to add
/// more. Purely presentational - picking is driven from the view.
class MediaAttachmentRow extends StatelessWidget {
  const MediaAttachmentRow({
    required this.mediaPaths,
    required this.onAddPhoto,
    required this.onAddVideo,
    required this.onRemove,
    super.key,
  });

  final List<String> mediaPaths;
  final VoidCallback onAddPhoto;
  final VoidCallback onAddVideo;
  final ValueChanged<String> onRemove;

  String _fileName(String path) => path.split(RegExp(r'[\\/]')).last;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: AppSpacing.xs,
          runSpacing: AppSpacing.xs,
          children: [
            for (final path in mediaPaths)
              Chip(
                avatar: const Icon(Icons.attachment, size: 16),
                label: Text(
                  _fileName(path),
                  overflow: TextOverflow.ellipsis,
                ),
                onDeleted: () => onRemove(path),
              ),
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        Row(
          children: [
            OutlinedButton.icon(
              onPressed: onAddPhoto,
              icon: const Icon(Icons.photo_camera_outlined, size: 18),
              label: const Text('Photo'),
            ),
            const SizedBox(width: AppSpacing.xs),
            OutlinedButton.icon(
              onPressed: onAddVideo,
              icon: const Icon(Icons.videocam_outlined, size: 18),
              label: const Text('Video'),
            ),
          ],
        ),
      ],
    );
  }
}
