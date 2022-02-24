// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  final secureStorage = const FlutterSecureStorage();
  var loadedPhotos = [];
  Future<void> fetchData() async {
    const apiUrl = 'https://jsonplaceholder.typicode.com/photos';

    final response = await http.get(Uri.parse(apiUrl));
    final data = json.decode(response.body);
    loadedPhotos = data;
    update();
  }

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  delData() {
    secureStorage.deleteAll();
  }

  getData(String key) async {
    var data = await secureStorage.read(key: key);
    print(data);
  }

  saveValue(String key, String value) {
    secureStorage.write(key: key, value: value);
  }
}
