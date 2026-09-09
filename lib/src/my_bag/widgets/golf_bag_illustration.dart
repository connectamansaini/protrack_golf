import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:protrack_golf/core/core.dart';

/// A stylised golf bag with one club head per group (Driver, Woods, Hybrid,
/// Long/Mid/Short Irons, Wedges, Putter) fanning out of it, drawn with a
/// [CustomPainter] - no image assets - plus a tappable legend of the groups
/// underneath. Groups in the golfer's bag are filled in fairway green; the
/// rest are a faint outline.
///
/// Pure widget: sets in, tap callbacks out. The hybrid has its own head and
/// legend chip; tapping it fires [onHybridTapped], every other group fires
/// [onCategoryTapped].
class GolfBagIllustration extends StatelessWidget {
  const GolfBagIllustration({
    required this.ownedCategories,
    super.key,
    this.hasHybrid = false,
    this.onCategoryTapped,
    this.onHybridTapped,
  });

  final Set<ClubCategory> ownedCategories;
  final bool hasHybrid;
  final ValueChanged<ClubCategory>? onCategoryTapped;
  final VoidCallback? onHybridTapped;

  static const double _minHeight = 170;
  static const double _maxHeight = 210;

  bool _isOwned(_ClubSlot slot) =>
      slot.isHybrid ? hasHybrid : ownedCategories.contains(slot.category);

  void _tap(_ClubSlot slot) {
    if (slot.isHybrid) {
      onHybridTapped?.call();
    } else {
      onCategoryTapped?.call(slot.category);
    }
  }

  void _handleTapUp(TapUpDetails details, Size size) {
    for (final slot in _BagGeometry.slots(size)) {
      if (slot.hitRect.contains(details.localPosition)) {
        _tap(slot);
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = (width * 0.5).clamp(_minHeight, _maxHeight);
        final size = Size(width, height);
        final slots = _BagGeometry.slots(size);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Semantics(
              label: 'Golf bag illustration',
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTapUp: (details) => _handleTapUp(details, size),
                child: RepaintBoundary(
                  child: CustomPaint(
                    size: size,
                    painter: _GolfBagPainter(
                      ownedCategories: ownedCategories,
                      hasHybrid: hasHybrid,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xs,
              children: [
                for (final slot in slots)
                  _LegendChip(
                    label: slot.label,
                    owned: _isOwned(slot),
                    onTap: () => _tap(slot),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}

/// Legend entry for one club group: filled with a tick when owned, outlined
/// with a plus when it's still to be added.
class _LegendChip extends StatelessWidget {
  const _LegendChip({
    required this.label,
    required this.owned,
    required this.onTap,
  });

  final String label;
  final bool owned;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: owned ? AppColors.fairwayGreen : AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadii.pill),
        side: BorderSide(
          color: owned ? AppColors.fairwayGreen : AppColors.border,
          width: AppStrokes.thin,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadii.pill),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.sm,
            vertical: AppSpacing.xs,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                owned ? Icons.check : Icons.add,
                size: AppSpacing.md,
                color: owned ? AppColors.white : AppColors.fairwayGreen,
              ),
              const SizedBox(width: AppSpacing.xxs),
              Text(
                label,
                style: AppTypography.textTheme.labelMedium?.copyWith(
                  color: owned ? AppColors.white : AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// The shape drawn for a slot's club head.
enum _HeadShape { driver, wood, hybrid, iron, wedge, putter }

/// One club head sticking out of the bag, in left-to-right order.
class _ClubSlot {
  const _ClubSlot({
    required this.category,
    required this.label,
    required this.shape,
    required this.headCenter,
    required this.rimPoint,
    required this.headSize,
    required this.hitRect,
    this.isHybrid = false,
  });

  final ClubCategory category;
  final String label;
  final _HeadShape shape;
  final Offset headCenter;
  final Offset rimPoint;
  final double headSize;
  final Rect hitRect;
  final bool isHybrid;
}

/// Shared geometry so the painter and the hit test agree on where every
/// club head is.
abstract final class _BagGeometry {
  const _BagGeometry._();

  static const List<(ClubCategory, String, _HeadShape, bool)> _slotSpecs = [
    (ClubCategory.driver, 'Driver', _HeadShape.driver, false),
    (ClubCategory.woods, 'Woods', _HeadShape.wood, false),
    (ClubCategory.woods, 'Hybrid', _HeadShape.hybrid, true),
    (ClubCategory.longIrons, 'Long irons', _HeadShape.iron, false),
    (ClubCategory.midIrons, 'Mid irons', _HeadShape.iron, false),
    (ClubCategory.shortIrons, 'Short irons', _HeadShape.iron, false),
    (ClubCategory.wedges, 'Wedges', _HeadShape.wedge, false),
    (ClubCategory.putter, 'Putter', _HeadShape.putter, false),
  ];

  static Offset rimCenter(Size size) =>
      Offset(size.width * 0.5, size.height * 0.42);

  static double rimRadiusX(Size size) => size.width * 0.125;

  static double rimRadiusY(Size size) => AppSpacing.xs + AppSpacing.xxs;

  static Rect bagBody(Size size) {
    final rim = rimCenter(size);
    final rx = rimRadiusX(size);
    return Rect.fromLTRB(
      rim.dx - rx,
      rim.dy,
      rim.dx + rx,
      size.height - AppSpacing.xxs,
    );
  }

  static List<_ClubSlot> slots(Size size) {
    final slotCount = _slotSpecs.length;
    final rim = rimCenter(size);
    final rx = rimRadiusX(size);
    final headSize = (size.width / 34).clamp(AppSpacing.xs, AppSpacing.md);
    // Heads spread across the top, lifted into a gentle arc so the fan reads
    // as clubs leaning out of a bag rather than a flat row.
    final spreadLeft = size.width * 0.07;
    final spreadRight = size.width * 0.93;
    final baseY = size.height * 0.26;
    final lift = size.height * 0.14;

    return [
      for (var i = 0; i < slotCount; i++)
        _buildSlot(
          spec: _slotSpecs[i],
          center: Offset(
            spreadLeft + (spreadRight - spreadLeft) * (i / (slotCount - 1)),
            baseY - lift * math.sin(math.pi * i / (slotCount - 1)),
          ),
          rimPoint: Offset(
            rim.dx + rx * 0.7 * ((i / (slotCount - 1)) * 2 - 1),
            rim.dy,
          ),
          headSize: headSize,
          slotWidth: (spreadRight - spreadLeft) / slotCount,
        ),
    ];
  }

  static _ClubSlot _buildSlot({
    required (ClubCategory, String, _HeadShape, bool) spec,
    required Offset center,
    required Offset rimPoint,
    required double headSize,
    required double slotWidth,
  }) {
    final (category, label, shape, isHybrid) = spec;
    return _ClubSlot(
      category: category,
      label: label,
      shape: shape,
      isHybrid: isHybrid,
      headCenter: center,
      rimPoint: rimPoint,
      headSize: headSize,
      hitRect: Rect.fromCenter(
        center: center,
        width: slotWidth,
        height: AppSpacing.tapTarget,
      ),
    );
  }
}

class _GolfBagPainter extends CustomPainter {
  const _GolfBagPainter({
    required this.ownedCategories,
    required this.hasHybrid,
  });

  final Set<ClubCategory> ownedCategories;
  final bool hasHybrid;

  static const double _unownedOpacity = 0.35;

  bool _isOwned(_ClubSlot slot) =>
      slot.isHybrid ? hasHybrid : ownedCategories.contains(slot.category);

  @override
  void paint(Canvas canvas, Size size) {
    final slots = _BagGeometry.slots(size);
    // Unowned shafts first so owned ones sit on top where they cross.
    for (final slot in slots.where((s) => !_isOwned(s))) {
      _paintShaft(canvas, slot, false);
    }
    for (final slot in slots.where(_isOwned)) {
      _paintShaft(canvas, slot, true);
    }
    _paintBag(canvas, size);
    for (final slot in slots) {
      _paintHead(canvas, slot, _isOwned(slot));
    }
  }

  void _paintBag(Canvas canvas, Size size) {
    final body = _BagGeometry.bagBody(size);
    final rim = _BagGeometry.rimCenter(size);
    final rimRect = Rect.fromCenter(
      center: rim,
      width: _BagGeometry.rimRadiusX(size) * 2 + AppSpacing.xs,
      height: _BagGeometry.rimRadiusY(size) * 2,
    );
    final bodyFill = Paint()..color = AppColors.fairwayGreen;
    final detail = Paint()
      ..color = AppColors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = AppStrokes.thin
      ..strokeCap = StrokeCap.round;

    // Body: slightly tapered towards the base, rounded at the bottom.
    final taper = body.width * 0.08;
    final bodyPath = Path()
      ..moveTo(body.left, body.top)
      ..lineTo(body.right, body.top)
      ..lineTo(body.right - taper, body.bottom - AppRadii.lg)
      ..quadraticBezierTo(
        body.right - taper,
        body.bottom,
        body.right - taper - AppRadii.lg,
        body.bottom,
      )
      ..lineTo(body.left + taper + AppRadii.lg, body.bottom)
      ..quadraticBezierTo(
        body.left + taper,
        body.bottom,
        body.left + taper,
        body.bottom - AppRadii.lg,
      )
      ..close();
    canvas.drawPath(bodyPath, bodyFill);

    // Strap looping down the left side.
    final strap = Path()
      ..moveTo(body.left + AppSpacing.xs, body.top + AppSpacing.md)
      ..quadraticBezierTo(
        body.left - AppSpacing.md,
        body.center.dy,
        body.left + taper + AppSpacing.xs,
        body.bottom - AppSpacing.md,
      );
    canvas.drawPath(
      strap,
      Paint()
        ..color = AppColors.sandGoldLight
        ..style = PaintingStyle.stroke
        ..strokeWidth = AppStrokes.thick
        ..strokeCap = StrokeCap.round,
    );

    // A band and two pockets picked out in white on the body.
    final bandY = body.top + body.height * 0.3;
    canvas.drawLine(
      Offset(body.left + AppSpacing.xs, bandY),
      Offset(body.right - AppSpacing.xs, bandY),
      detail,
    );
    final pocketTop = body.top + body.height * 0.45;
    final pocketHeight = body.height * 0.35;
    final pocketWidth = (body.width - taper * 2 - AppSpacing.md * 3) / 2;
    for (var i = 0; i < 2; i++) {
      final left = body.left + taper + AppSpacing.md + i * (pocketWidth + AppSpacing.md);
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(left, pocketTop, pocketWidth, pocketHeight),
          const Radius.circular(AppRadii.sm),
        ),
        detail,
      );
    }

    // Rim last so the shafts appear to come from inside the bag.
    canvas
      ..drawOval(rimRect, Paint()..color = AppColors.fairwayGreenDark)
      ..drawOval(
        rimRect,
        Paint()
          ..color = AppColors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = AppStrokes.thin,
      );
  }

  void _paintShaft(Canvas canvas, _ClubSlot slot, bool owned) {
    final paint = Paint()
      ..color = owned
          ? AppColors.fairwayGreen
          : AppColors.charcoal.withValues(alpha: _unownedOpacity)
      ..strokeWidth = owned ? AppStrokes.thick : AppStrokes.thin
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(slot.rimPoint, slot.headCenter, paint);
  }

  void _paintHead(Canvas canvas, _ClubSlot slot, bool owned) {
    final fill = Paint()
      ..color = owned
          ? AppColors.fairwayGreen
          : AppColors.charcoal.withValues(alpha: _unownedOpacity)
      ..style = owned ? PaintingStyle.fill : PaintingStyle.stroke
      ..strokeWidth = AppStrokes.thin
      ..strokeJoin = StrokeJoin.round;
    final s = slot.headSize;
    final c = slot.headCenter;

    switch (slot.shape) {
      case _HeadShape.driver:
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromCenter(center: c, width: s * 2.4, height: s * 1.8),
            Radius.circular(s),
          ),
          fill,
        );
      case _HeadShape.wood:
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromCenter(center: c, width: s * 2.0, height: s * 1.5),
            Radius.circular(s * 0.8),
          ),
          fill,
        );
      case _HeadShape.hybrid:
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromCenter(center: c, width: s * 1.8, height: s * 1.2),
            Radius.circular(s * 0.5),
          ),
          fill,
        );
      case _HeadShape.iron:
        // A blade: narrow at the hosel (top-left), wider along the sole.
        final blade = Path()
          ..moveTo(c.dx - s * 0.7, c.dy - s * 0.8)
          ..lineTo(c.dx + s * 0.5, c.dy - s * 0.6)
          ..lineTo(c.dx + s * 1.1, c.dy + s * 0.4)
          ..quadraticBezierTo(
            c.dx + s * 1.0,
            c.dy + s * 0.85,
            c.dx + s * 0.4,
            c.dy + s * 0.85,
          )
          ..lineTo(c.dx - s * 1.0, c.dy + s * 0.85)
          ..close();
        canvas.drawPath(blade, fill);
      case _HeadShape.wedge:
        canvas.drawRRect(
          RRect.fromRectAndCorners(
            Rect.fromCenter(center: c, width: s * 2.2, height: s * 1.5),
            topLeft: Radius.circular(s * 0.2),
            topRight: Radius.circular(s * 0.5),
            bottomLeft: Radius.circular(s * 0.8),
            bottomRight: Radius.circular(s),
          ),
          fill,
        );
      case _HeadShape.putter:
        canvas
          ..drawRRect(
            RRect.fromRectAndRadius(
              Rect.fromCenter(
                center: Offset(c.dx, c.dy + s * 0.3),
                width: s * 2.4,
                height: s * 0.7,
              ),
              Radius.circular(s * 0.2),
            ),
            fill,
          )
          ..drawLine(
            Offset(c.dx - s * 0.6, c.dy + s * 0.3),
            Offset(c.dx - s * 0.6, c.dy - s * 0.5),
            Paint()
              ..color = fill.color
              ..strokeWidth = AppStrokes.regular
              ..strokeCap = StrokeCap.round,
          );
    }
  }

  @override
  bool shouldRepaint(_GolfBagPainter oldDelegate) =>
      oldDelegate.hasHybrid != hasHybrid ||
      !setEquals(oldDelegate.ownedCategories, ownedCategories);
}
