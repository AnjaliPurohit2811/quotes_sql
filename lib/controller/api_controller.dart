import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../helper/db_helper.dart';

class ApiController extends GetxController {
  var isLoading = true.obs;
  var quotesList = <Map<String, dynamic>>[].obs;
  var favouriteList = <Map<String, dynamic>>[].obs;
  var selectedIndex = 0.obs;

  final DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  void onInit() {
    fetchQuotes();
    super.onInit();
  }

  void fetchQuotes() async {
    try {
      final response = await http.get(Uri.parse('https://sheetdb.io/api/v1/ljnaghvhgl8w5'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        quotesList.value = List<Map<String, dynamic>>.from(data);
      }
    } finally {
      isLoading.value = false;
    }
  }
  void fetchFavorites() async {
    favouriteList.value = await _dbHelper.getFavorites();
  }

  void addFavorite(Map<String, dynamic> quote) async {
    await _dbHelper.insertFavorite(quote);
    favouriteList.add(quote);
  }

  void removeFavorite(Map<String, dynamic> quote) async {
    await _dbHelper.removeFavorite(quote['quote']);
    favouriteList.removeWhere((element) => element['quote'] == quote['quote']);
  }

  void toggleFavorite(Map<String, dynamic> quote) {
    if (isFavorite(quote)) {
      removeFavorite(quote);
    } else {
      addFavorite(quote);
    }
  }

  bool isFavorite(Map<String, dynamic> quote) {
    return favouriteList.any((element) => element['quote'] == quote['quote']);
  }
}
