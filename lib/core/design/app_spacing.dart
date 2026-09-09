/// Spacing tokens. Always prefer these over raw numeric literals in widgets.
abstract final class AppSpacing {
  const AppSpacing._();

  static const double xxs = 4;
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;

  /// Minimum height/width of anything tappable, for gloved or hurried taps.
  static const double tapTarget = 48;
}
