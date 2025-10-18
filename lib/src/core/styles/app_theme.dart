import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app_skeleton/src/core/styles/app_dimensions.dart';
import 'package:flutter_app_skeleton/src/core/styles/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    colorScheme: AppColors.lightColorScheme,
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      actionsPadding: AppPadding.horizontalSm,
    ),
    fontFamily: GoogleFonts.cairo().fontFamily,
    bottomSheetTheme: BottomSheetThemeData(
      showDragHandle: true,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.sheet),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      borderRadius: AppRadius.radiusSm,
      year2023: false,
    ),
    dividerTheme: DividerThemeData(space: 1),
    cardTheme: CardThemeData(
      clipBehavior: Clip.antiAlias,
      surfaceTintColor: AppColors.primary,
    ),
    inputDecorationTheme: InputDecorationThemeData(
      border: OutlineInputBorder(borderRadius: AppRadius.input),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: AppPadding.sm,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        fixedSize: Size.fromHeight(AppSizes.buttonHeightSm),
        shape: RoundedRectangleBorder(borderRadius: AppRadius.button),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        fixedSize: Size.fromHeight(AppSizes.buttonHeightSm),
        shape: RoundedRectangleBorder(borderRadius: AppRadius.button),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 1,
        fixedSize: Size.fromHeight(AppSizes.buttonHeightSm),
        shape: RoundedRectangleBorder(borderRadius: AppRadius.button),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.primary,
      actionTextColor: AppColors.textOnPrimary,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        fixedSize: Size.fromHeight(AppSizes.buttonHeightSm),
        shape: RoundedRectangleBorder(borderRadius: AppRadius.button),
      ),
    ),
  );
}
