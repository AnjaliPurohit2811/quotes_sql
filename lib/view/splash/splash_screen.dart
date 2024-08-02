import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_sql/view/intro/intro_screen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 7), () { Get.to(const IntroPage());});
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 400 , left: 50),
            child: Container(
              height: 130,
              width: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('asset/img/logo.jpeg')),
              ),
            ),
          )
        ],
      ),
    );
  }
}
