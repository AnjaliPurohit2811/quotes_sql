import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_sql/view/category/category_screen.dart';
import 'package:quotes_sql/view/intro/intro_screen.dart';
import 'package:quotes_sql/view/settings/setting_screen.dart';

import 'view/favourite/favourite_screen.dart';
import 'view/home/home_page.dart';
import 'view/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      // getPages: [
      //   GetPage(name: '/', page: () => SplashPage()),
      //   GetPage(name: '/intro', page: () => IntroPage())
      // ],
    );
  }
}
