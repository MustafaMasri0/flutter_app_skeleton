import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_skeleton/src/core/translations/locale_keys.g.dart';
import 'package:flutter_app_skeleton/src/core/utils/extensions/context_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = context.locale.toString();
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.app_name.tr())),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.welcome_message.tr(),
              style: context.textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Text(
              'Current Locale: $currentLocale',
              style: context.textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
