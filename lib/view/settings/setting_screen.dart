import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: const Text('Switch theme'),
                trailing: Switch(
                  value: false,
                  onChanged: (value) {

                  },
                ),
                onTap: () {

                },
              ),
              ListTile(
                title: const Text('Logout'),
                trailing: const Icon(Icons.logout, color: Colors.orange),
                onTap: () {

                },
              ),
              const Divider(),
              ListTile(
                title: const Text('Licenses'),
                leading: const Icon(Icons.article_outlined, color: Colors.orange),
                onTap: () {
                  // Handle navigation to Licenses
                },
              ),
              ListTile(
                title: const Text('Privacy policy'),
                leading: const Icon(Icons.privacy_tip_outlined, color: Colors.orange),
                onTap: () {
                  // Handle navigation to Privacy policy
                },
              ),
              ListTile(
                title: const Text('Rate App'),
                subtitle: const Text('Play Store'),
                leading: const Icon(Icons.rate_review_outlined, color: Colors.orange),
                onTap: () {
                  // Handle rate app
                },
              ),
              ListTile(
                title: const Text('Write to me'),
                subtitle: const Text('appsnext@gmail.com'),
                leading: const Icon(Icons.mail_outline_outlined, color: Colors.orange),
                onTap: () {
                  // Handle write to me
                },
              ),
              const Divider(),
              ListTile(
                title: const Text('Unsplash'),
                subtitle: const Text('Image provider'),
                leading: const Icon(Icons.image_outlined, color: Colors.orange),
                onTap: () {
                  // Handle navigation to Unsplash
                },
              ),
              ListTile(
                title: const Text('Zen Quotes'),
                subtitle: const Text('Quotes provider'),
                leading: const Icon(Icons.format_quote_outlined, color: Colors.orange),
                onTap: () {
                  // Handle navigation to Zen Quotes
                },
              ),
             Padding(
               padding: const EdgeInsets.only(top: 80,left: 90),
               child: Container(
                 height: 60,
                 width: 200,
                 decoration: BoxDecoration(
                   image: DecorationImage(image: AssetImage('asset/img/logo.jpeg'))
                 ),
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}
