import 'dart:async';

import 'package:find_sport/core/app_icons.dart';
import 'package:find_sport/main.dart';
import 'package:find_sport/screens/home_screen/home_screen.dart';
import 'package:find_sport/screens/select_lang_screen/select_lang_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _openNextPage() async {
    Timer(
      const Duration(seconds: 2),
      () async {
        bool isProfile = GetStorage().read('is_profile') ?? false;
        if (isProfile) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const SelectLangScreen(),
            ),
          );
        }
      },
    );
  }

  @override
  void didChangeDependencies() {
    _openNextPage();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Image.asset(
            AppIcons.logo,
          ),
        ),
      ),
    );
  }
}
