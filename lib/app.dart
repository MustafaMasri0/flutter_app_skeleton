import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_skeleton/src/core/translations/locale_keys.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_app_skeleton/src/core/router/app_router.dart';
import 'package:flutter_app_skeleton/src/core/styles/app_theme.dart';

import 'src/core/styles/app_colors.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: LocaleKeys.app_name.tr(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: router,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      color: AppColors.primary,
    );
  }
}
