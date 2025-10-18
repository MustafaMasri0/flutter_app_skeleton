import 'package:flutter/material.dart';

abstract class AppColors {
  AppColors._();

  // Brand colors
  static const Color primary = Color(0xFF0055A3);
  static const Color primaryLight = Color(0xFF3D7FC4);
  static const Color primaryDark = Color(0xFF003D75);

  // Using same colors as primary for unified brand look
  static const Color secondary = primary;
  static const Color secondaryLight = primaryLight;
  static const Color secondaryDark = primaryDark;

  // Neutral colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color grey50 = Color(0xFFFAFAFA);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey800 = Color(0xFF424242);
  static const Color grey900 = Color(0xFF212121);

  // Semantic colors
  static const Color success = Color(0xFF4CAF50);
  static const Color successLight = Color(0xFF81C784);
  static const Color successDark = Color(0xFF388E3C);

  static const Color warning = Color(0xFFFFC107);
  static const Color warningLight = Color(0xFFFFD54F);
  static const Color warningDark = Color(0xFFFFA000);

  static const Color error = Color(0xFFF44336);
  static const Color errorLight = Color(0xFFE57373);
  static const Color errorDark = Color(0xFFD32F2F);

  static const Color info = Color(0xFF2196F3);
  static const Color infoLight = Color(0xFF64B5F6);
  static const Color infoDark = Color(0xFF1976D2);

  // Surface colors
  static const Color background = grey50;
  static const Color surface = white;
  static const Color surfaceVariant = grey100;

  // Text colors
  static const Color textPrimary = grey900;
  static const Color textSecondary = grey600;
  static const Color textDisabled = grey400;
  static const Color textOnPrimary = white;
  static const Color textOnSecondary = white;

  // Border colors
  static const Color border = grey300;
  static const Color borderLight = grey200;
  static const Color divider = grey200;

  // Overlay colors
  static const Color overlay = Color(0x66000000); // 40% black
  static const Color overlayLight = Color(0x33000000); // 20% black
  static const Color scrim = Color(0x99000000); // 60% black

  // Container colors (very light tints for Material 3)
  static const Color primaryContainerLight = Color(0xFFD4E4F7);
  static const Color secondaryContainerLight = Color(0xFFD4E4F7);
  static const Color tertiaryContainerLight = Color(0xFFD0E8FF);
  static const Color errorContainerLight = Color(0xFFFFDAD6);

  // Color schemes
  static ColorScheme get lightColorScheme => ColorScheme(
    brightness: Brightness.light,
    // Primary colors
    primary: primary,
    onPrimary: textOnPrimary,
    primaryContainer: primaryContainerLight,
    onPrimaryContainer: primaryDark,
    primaryFixed: primaryLight,
    onPrimaryFixed: primaryDark,
    primaryFixedDim: primary,
    onPrimaryFixedVariant: textOnPrimary,

    // Secondary colors
    secondary: secondary,
    onSecondary: textOnSecondary,
    secondaryContainer: secondaryContainerLight,
    onSecondaryContainer: secondaryDark,
    secondaryFixed: secondaryLight,
    onSecondaryFixed: secondaryDark,
    secondaryFixedDim: secondary,
    onSecondaryFixedVariant: textOnSecondary,

    // Tertiary colors (using info colors as tertiary)
    tertiary: info,
    onTertiary: white,
    tertiaryContainer: tertiaryContainerLight,
    onTertiaryContainer: infoDark,
    tertiaryFixed: infoLight,
    onTertiaryFixed: infoDark,
    tertiaryFixedDim: info,
    onTertiaryFixedVariant: white,

    // Error colors
    error: error,
    onError: white,
    errorContainer: errorContainerLight,
    onErrorContainer: errorDark,

    // Surface colors
    surface: surface,
    onSurface: textPrimary,
    surfaceDim: grey200,
    surfaceBright: white,
    surfaceContainerLowest: white,
    surfaceContainerLow: grey50,
    surfaceContainer: grey100,
    surfaceContainerHigh: grey200,
    surfaceContainerHighest: grey300,
    onSurfaceVariant: textSecondary,

    // Outline colors
    outline: border,
    outlineVariant: borderLight,

    // Other colors
    shadow: black,
    scrim: scrim,
    inverseSurface: grey800,
    onInverseSurface: grey100,
    inversePrimary: primaryLight,

    // Surface tint
    surfaceTint: primary,
  );

  static ColorScheme get darkColorScheme => ColorScheme(
    brightness: Brightness.dark,
    // Primary colors
    primary: primaryLight,
    onPrimary: primaryDark,
    primaryContainer: primaryDark,
    onPrimaryContainer: primaryContainerLight,
    primaryFixed: primaryLight,
    onPrimaryFixed: primaryDark,
    primaryFixedDim: primary,
    onPrimaryFixedVariant: primaryDark,

    // Secondary colors
    secondary: secondaryLight,
    onSecondary: secondaryDark,
    secondaryContainer: secondaryDark,
    onSecondaryContainer: secondaryContainerLight,
    secondaryFixed: secondaryLight,
    onSecondaryFixed: secondaryDark,
    secondaryFixedDim: secondary,
    onSecondaryFixedVariant: secondaryDark,

    // Tertiary colors (using info colors as tertiary)
    tertiary: infoLight,
    onTertiary: infoDark,
    tertiaryContainer: infoDark,
    onTertiaryContainer: tertiaryContainerLight,
    tertiaryFixed: infoLight,
    onTertiaryFixed: infoDark,
    tertiaryFixedDim: info,
    onTertiaryFixedVariant: infoDark,

    // Error colors
    error: errorLight,
    onError: errorDark,
    errorContainer: errorDark,
    onErrorContainer: errorContainerLight,

    // Surface colors
    surface: grey900,
    onSurface: grey100,
    surfaceDim: black,
    surfaceBright: grey700,
    surfaceContainerLowest: black,
    surfaceContainerLow: grey900,
    surfaceContainer: grey800,
    surfaceContainerHigh: grey700,
    surfaceContainerHighest: grey600,
    onSurfaceVariant: grey400,

    // Outline colors
    outline: grey600,
    outlineVariant: grey700,

    // Other colors
    shadow: black,
    scrim: scrim,
    inverseSurface: grey100,
    onInverseSurface: grey900,
    inversePrimary: primary,

    // Surface tint
    surfaceTint: primaryLight,
  );
}
