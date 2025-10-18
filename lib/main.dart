import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_app_skeleton/app.dart';
import 'package:flutter_app_skeleton/src/core/constants/app_assets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await dotenv.load(fileName: ".env.dev");
  runApp(
    ProviderScope(
      child: EasyLocalization(
        saveLocale: true,
        useOnlyLangCode: true,
        useFallbackTranslations: true,
        fallbackLocale: const Locale('en'),
        assetLoader: const RootBundleAssetLoader(),
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: AppAssets.translationsPath,
        child: const App(),
      ),
    ),
  );
}
