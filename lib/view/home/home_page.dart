import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_sql/controller/api_controller.dart';
import 'package:quotes_sql/utils/image_list.dart';
import 'package:quotes_sql/view/favourite/favourite_screen.dart';
import 'package:quotes_sql/view/settings/setting_screen.dart';
import 'package:share_extend/share_extend.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ApiController apiController = Get.put(ApiController());
    return Scaffold(
      body: Obx(() {
        if (apiController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: apiController.quotesList.length,
            itemBuilder: (context, index) {
              final quote = apiController.quotesList[index];
              final isFavorite = apiController.isFavorite(quote);
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imgList[index % imgList.length]), // Background image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40, left: 20),
                        child: Container(
                          height: 50,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              '${quote['category']}',
                              style: const TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40, left: 120),
                        child: InkWell(
                          onTap: () {
                            Get.to(FavoritesScreen());
                          },
                          child: Container(
                            height: 50,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.favorite_outline, color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40, left: 10),
                        child: InkWell(
                          onTap: () {
                            Get.to(const SettingsScreen());
                          },
                          child: Container(
                            height: 50,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.settings, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '“${quote['quote']}”',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black54,
                                  offset: Offset(2.0, 2.0),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            quote['author']!,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 10.0,
                                  color: Colors.black54,
                                  offset: Offset(2.0, 2.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Icons at the bottom
                  Positioned(
                    bottom: 16,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.info, color: Colors.white),
                          onPressed: () {},
                        ),
                        const SizedBox(width: 16),
                        IconButton(
                          icon: const Icon(Icons.file_download, color: Colors.white),
                          onPressed: () {},
                        ),
                        const SizedBox(width: 16),
                        IconButton(
                          icon: const Icon(Icons.share, color: Colors.white),
                          onPressed: () {
                            ShareExtend.share("${quote['quote']}", "text");
                          },
                        ),
                        const SizedBox(width: 16),
                        IconButton(
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.white,
                          ),
                          onPressed: () {
                            apiController.toggleFavorite(quote);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        }
      }),
    );
  }
}
