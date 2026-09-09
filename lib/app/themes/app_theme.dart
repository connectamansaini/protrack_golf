import 'package:flutter/material.dart';
import 'package:protrack_golf/core/core.dart';

/// The app's single Material theme, built entirely from design tokens.
///
/// Tuned for bright sunlight: pure white surfaces separated by dark
/// borders instead of tints, near-black text, and solid dark-green fills
/// with white text for anything selected or primary.
abstract final class AppTheme {
  const AppTheme._();

  static OutlineInputBorder _inputBorder(Color color, double width) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.md),
        borderSide: BorderSide(color: color, width: width),
      );

  static RoundedRectangleBorder _outlinedShape(double radius) =>
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
        side: const BorderSide(color: AppColors.border, width: AppStrokes.thin),
      );

  static ThemeData get light {
    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: AppColors.fairwayGreen,
        ).copyWith(
          primary: AppColors.fairwayGreen,
          onPrimary: AppColors.white,
          secondary: AppColors.sandGold,
          onSecondary: AppColors.white,
          surface: AppColors.surface,
          onSurface: AppColors.textPrimary,
          onSurfaceVariant: AppColors.textSecondary,
          outline: AppColors.border,
          outlineVariant: AppColors.divider,
          error: AppColors.error,
          onError: AppColors.white,
        );
    const textTheme = AppTypography.textTheme;
    const minTapSize = Size(AppSpacing.tapTarget, AppSpacing.tapTarget);
    const buttonPadding = EdgeInsets.symmetric(
      horizontal: AppSpacing.lg,
      vertical: AppSpacing.sm,
    );
    final buttonShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadii.md),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.background,
      canvasColor: AppColors.surface,
      textTheme: textTheme,
      iconTheme: const IconThemeData(color: AppColors.textPrimary),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background,
        surfaceTintColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: textTheme.headlineSmall,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        border: _inputBorder(AppColors.border, AppStrokes.regular),
        enabledBorder: _inputBorder(AppColors.border, AppStrokes.regular),
        focusedBorder: _inputBorder(AppColors.fairwayGreen, AppStrokes.thick),
        errorBorder: _inputBorder(AppColors.error, AppStrokes.regular),
        focusedErrorBorder: _inputBorder(AppColors.error, AppStrokes.thick),
        labelStyle: textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w600,
        ),
        floatingLabelStyle: textTheme.labelMedium?.copyWith(
          color: AppColors.fairwayGreen,
        ),
        hintStyle: textTheme.bodyMedium?.copyWith(
          color: AppColors.textSecondary,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        surfaceTintColor: AppColors.surface,
        elevation: 0,
        shape: _outlinedShape(AppRadii.md),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surface,
        selectedColor: AppColors.fairwayGreen,
        side: const BorderSide(
          color: AppColors.border,
          width: AppStrokes.regular,
        ),
        labelStyle: textTheme.labelMedium,
        secondaryLabelStyle: textTheme.labelMedium?.copyWith(
          color: AppColors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.pill),
        ),
        showCheckmark: false,
        deleteIconColor: AppColors.textPrimary,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.fairwayGreen,
          foregroundColor: AppColors.white,
          disabledBackgroundColor: AppColors.divider,
          disabledForegroundColor: AppColors.white,
          minimumSize: minTapSize,
          padding: buttonPadding,
          shape: buttonShape,
          textStyle: textTheme.labelLarge,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.fairwayGreen,
          disabledForegroundColor: AppColors.textSecondary,
          side: const BorderSide(
            color: AppColors.fairwayGreen,
            width: AppStrokes.regular,
          ),
          minimumSize: minTapSize,
          padding: buttonPadding,
          shape: buttonShape,
          textStyle: textTheme.labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.fairwayGreen,
          disabledForegroundColor: AppColors.textSecondary,
          minimumSize: minTapSize,
          textStyle: textTheme.labelLarge,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.fairwayGreen,
        foregroundColor: AppColors.white,
        extendedTextStyle: textTheme.labelLarge,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.background,
        surfaceTintColor: AppColors.background,
        indicatorColor: AppColors.fairwayGreen,
        elevation: 0,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        iconTheme: WidgetStateProperty.resolveWith(
          (states) => IconThemeData(
            color: states.contains(WidgetState.selected)
                ? AppColors.white
                : AppColors.textPrimary,
          ),
        ),
        labelTextStyle: WidgetStateProperty.all(
          textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.divider,
        thickness: AppStrokes.thin,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.surface,
        surfaceTintColor: AppColors.surface,
        shape: _outlinedShape(AppRadii.lg),
        titleTextStyle: textTheme.headlineSmall,
        contentTextStyle: textTheme.bodyMedium,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.surface,
        surfaceTintColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppRadii.xl),
          ),
          side: BorderSide(color: AppColors.border, width: AppStrokes.thin),
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: AppColors.surface,
        surfaceTintColor: AppColors.surface,
        textStyle: textTheme.bodyMedium,
        shape: _outlinedShape(AppRadii.md),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.textPrimary,
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: AppColors.white,
        ),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: AppColors.fairwayGreen,
        thumbColor: AppColors.fairwayGreen,
        inactiveTrackColor: AppColors.divider,
        valueIndicatorColor: AppColors.fairwayGreen,
        valueIndicatorTextStyle: textTheme.labelLarge,
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: AppColors.textPrimary,
        textColor: AppColors.textPrimary,
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.fairwayGreen,
      ),
    );
  }
}
