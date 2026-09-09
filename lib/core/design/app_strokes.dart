/// Stroke/border-width tokens. Borders replace tone-on-tone surfaces in the
/// sunlight-readable theme, so they must be clearly visible - never thinner
/// than [thin].
abstract final class AppStrokes {
  const AppStrokes._();

  /// Card outlines.
  static const double thin = 1.5;

  /// Inputs, chips, and secondary buttons.
  static const double regular = 2;

  /// Focused inputs and illustration emphasis.
  static const double thick = 3;
}
