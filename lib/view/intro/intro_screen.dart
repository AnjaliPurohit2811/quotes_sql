import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_sql/view/home/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              const Text(
                'Greetings!',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
              ),
              const SizedBox(height: 10),
              const Text(
                'Explore the best quotes to stay motivated!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              Container(
                height: 250,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage('asset/img/intro.jpg'),fit: BoxFit.cover),),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Get.to(const HomePage());
                },
                child: Container(
                  height: 60,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.orangeAccent,
                          spreadRadius: 2,
                          blurRadius: 1
                      )
                      ]),
                  child: const Center(
                    child: Text(
                      "Let's Get Started",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
