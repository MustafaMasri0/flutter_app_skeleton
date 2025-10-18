import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// Base sizes following 8px grid system
abstract class AppSizes {
  static const double s4 = 4.0;
  static const double s8 = 8.0;
  static const double s12 = 12.0;
  static const double s16 = 16.0;
  static const double s20 = 20.0;
  static const double s24 = 24.0;
  static const double s32 = 32.0;
  static const double s48 = 48.0;
  static const double s64 = 64.0;

  static const double fullRadius = 999.0;

  // Icons
  static const double iconSm = s20;
  static const double iconMd = s24;
  static const double iconLg = s32;

  // Avatars
  static const double avatarSm = s32;
  static const double avatarMd = s48;
  static const double avatarLg = s64;

  // Buttons
  static const double buttonHeightSm = 32.0;
  static const double buttonHeightMd = 44.0;
  static const double buttonHeightLg = 52.0;

  // Inputs
  static const double inputHeightMd = 48.0;
  static const double inputHeightLg = 56.0;
}

/// Spacing scale for gaps and margins
abstract class AppSpacing {
  static const double xs = AppSizes.s4;
  static const double sm = AppSizes.s8;
  static const double md = AppSizes.s16;
  static const double lg = AppSizes.s24;
  static const double xl = AppSizes.s32;
}

/// Predefined padding configurations
abstract class AppPadding {
  static const EdgeInsets xs = EdgeInsets.all(AppSpacing.xs);
  static const EdgeInsets sm = EdgeInsets.all(AppSpacing.sm);
  static const EdgeInsets md = EdgeInsets.all(AppSpacing.md);
  static const EdgeInsets lg = EdgeInsets.all(AppSpacing.lg);

  static const EdgeInsets horizontalSm = EdgeInsets.symmetric(
    horizontal: AppSpacing.sm,
  );
  static const EdgeInsets horizontalMd = EdgeInsets.symmetric(
    horizontal: AppSpacing.md,
  );
  static const EdgeInsets horizontalLg = EdgeInsets.symmetric(
    horizontal: AppSpacing.lg,
  );

  static const EdgeInsets verticalSm = EdgeInsets.symmetric(
    vertical: AppSpacing.sm,
  );
  static const EdgeInsets verticalMd = EdgeInsets.symmetric(
    vertical: AppSpacing.md,
  );
  static const EdgeInsets verticalLg = EdgeInsets.symmetric(
    vertical: AppSpacing.lg,
  );

  static const EdgeInsets screen = EdgeInsets.all(AppSpacing.md);
  static const EdgeInsets screenHorizontal = EdgeInsets.symmetric(
    horizontal: AppSpacing.md,
  );

  static const EdgeInsets button = EdgeInsets.symmetric(
    horizontal: AppSpacing.lg,
    vertical: AppSpacing.sm,
  );
  static const EdgeInsets card = EdgeInsets.all(AppSpacing.md);
  static const EdgeInsets listTile = EdgeInsets.symmetric(
    horizontal: AppSpacing.md,
    vertical: AppSpacing.sm,
  );
}

/// Border radius values and configurations
abstract class AppRadius {
  static const double sm = AppSizes.s4;
  static const double md = AppSizes.s8;
  static const double lg = AppSizes.s12;
  static const double xl = AppSizes.s16;
  static const double full = AppSizes.fullRadius;

  static final BorderRadius radiusSm = BorderRadius.circular(sm);
  static final BorderRadius radiusMd = BorderRadius.circular(md);
  static final BorderRadius radiusLg = BorderRadius.circular(lg);
  static final BorderRadius radiusXl = BorderRadius.circular(xl);
  static final BorderRadius radiusFull = BorderRadius.circular(full);

  static final BorderRadius button = radiusMd;
  static final BorderRadius card = radiusLg;
  static final BorderRadius sheet = radiusLg;
  static final BorderRadius input = radiusMd;
}

/// Gap widgets for spacing in Columns/Rows
abstract class AppGap {
  static const Widget xs = Gap(AppSpacing.xs);
  static const Widget sm = Gap(AppSpacing.sm);
  static const Widget md = Gap(AppSpacing.md);
  static const Widget lg = Gap(AppSpacing.lg);
  static const Widget xl = Gap(AppSpacing.xl);
}
