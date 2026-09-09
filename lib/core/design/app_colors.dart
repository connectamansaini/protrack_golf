import 'package:flutter/material.dart';

/// Sunlight-readable color tokens shared across the whole app.
///
/// The palette is built for reading a phone outdoors: a pure white ground,
/// near-black text, dark borders instead of tone-on-tone surfaces, and
/// accents dark enough to carry white text at 4.5:1 or better. Every
/// contrast ratio noted below is against [white].
///
/// Widgets must never hardcode a [Color] literal - always reach for a
/// token defined here so the palette stays centralized and consistent.
abstract final class AppColors {
  const AppColors._();

  /// Primary brand and primary-action color - a deep fairway green (8.7:1).
  static const Color fairwayGreen = Color(0xFF2E5339);

  /// A darker shade of fairway green, used for emphasis and pressed states.
  static const Color fairwayGreenDark = Color(0xFF1B3323);

  /// A lighter shade of fairway green (5.1:1). Icons and fills only - never
  /// body text.
  static const Color fairwayGreenLight = Color(0xFF4A7856);

  /// A pale green tint for selected/owned backgrounds that still keeps
  /// [fairwayGreen] text at 7:1 on top of it.
  static const Color fairwayGreenTint = Color(0xFFE3EEE6);

  /// Deep amber accent for highlights and chart markers (5.3:1). Dark enough
  /// to be read as text on white, and to carry white text if ever needed.
  static const Color sandGold = Color(0xFF8F6400);

  /// Lighter gold, used only as a chart/illustration highlight fill on dark
  /// surfaces - never as text on white.
  static const Color sandGoldLight = Color(0xFFE3B65C);

  /// Pure white: the app background and every surface.
  static const Color white = Color(0xFFFFFFFF);

  /// Scaffold background.
  static const Color background = white;

  /// Cards, sheets, inputs, chips - white, distinguished by [border].
  static const Color surface = white;

  /// Primary text (near black, 18.9:1).
  static const Color textPrimary = Color(0xFF111111);

  /// Secondary text - a dark grey that still reads in sun (8.9:1).
  static const Color textSecondary = Color(0xFF4A4A4A);

  /// Ink for outlines and illustrations (same value as [textPrimary]).
  static const Color charcoal = textPrimary;

  /// Card, input, and chip outlines.
  static const Color border = Color(0xFF222222);

  /// Chart grid lines and hairline dividers (4.5:1).
  static const Color divider = Color(0xFF767676);

  /// Error/destructive color (6.5:1).
  static const Color error = Color(0xFFB3261E);

  /// Positive-change color, e.g. a club's average went up (5.3:1).
  static const Color success = Color(0xFF2E7A48);

  /// Muted negative-change color, e.g. a club's average dipped (6.7:1).
  /// Softer than [error] on purpose - a shorter session isn't a mistake.
  static const Color decline = Color(0xFF8C4A33);
}
