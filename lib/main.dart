import 'package:easy_localization/easy_localization.dart';
import 'package:find_sport/core/localization/locates.dart';
import 'package:find_sport/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  await EasyLocalization.ensureInitialized();
  await GetStorage.init();

  runApp(
    EasyLocalization(
      fallbackLocale: Locates.all.first,
      supportedLocales: Locates.all,
      path: 'assets/language',
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Find Sport',
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black, primary: Colors.black),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: false,
      ),
      home: const SplashScreen(),
    );
  }
}
