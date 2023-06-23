import 'package:flutter/material.dart';
import 'package:flutter_advanced/pages/databases_page.dart';
import 'package:flutter_advanced/pages/home_page.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('pdp_online');
  await GetStorage.init();

  runApp(
    EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ru', 'RU'),
          Locale('uz', 'UZ'),

        ],
        path: 'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('en', 'US'),
        child: const MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: const HomePage(),
    routes: {

      DatabasePage.id: (context) => const DatabasePage (),
    });
  }
}