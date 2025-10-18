import 'package:flutter/material.dart';
import 'package:flutter_app_skeleton/src/core/styles/app_dimensions.dart';
import 'package:flutter_app_skeleton/src/core/styles/app_colors.dart';

/// A reusable loading indicator widget.
///
/// This widget displays a circular progress indicator with predefined dimensions and colors.
class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: AppSizes.s32,
        child: CircularProgressIndicator(
          strokeWidth: 3,
          backgroundColor: AppColors.primaryContainerLight,
        ),
      ),
    );
  }
}
