import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/api_controller.dart';

class QuoteCard extends StatelessWidget {
  final Map<String, dynamic> quote;

  const QuoteCard({Key? key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApiController apiController = Get.put(ApiController());
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '“${quote['quote']}”',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              quote['author']!,
              style: const TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              quote['category']!,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
