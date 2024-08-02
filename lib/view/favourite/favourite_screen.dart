import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_sql/controller/api_controller.dart';
import 'components/quote_card.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ApiController apiController = Get.find<ApiController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Favorites'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Icon(Icons.sync),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (apiController.favouriteList.isEmpty) {
            return const Center(
              child: Text('No favorite quotes yet.'),
            );
          } else {
            return ListView.builder(
              itemCount: apiController.favouriteList.length,
              itemBuilder: (context, index) {
                final quote = apiController.favouriteList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: QuoteCard(quote: quote),
                );
              },
            );
          }
        }),
      ),
    );
  }
}
