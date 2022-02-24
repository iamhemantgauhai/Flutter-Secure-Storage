import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:security/app/pages/home/home.dart';
import 'package:security/app/utils/utils.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());

  HomeScreen({Key? key}) : super(key: key);
  var keys = 'myKey';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[300],
        title: Text(
          title,
          style: const TextStyle(color: Colors.green, fontSize: 25.0),
        ),
        actions: [
          TextButton(
            onPressed: () {
              homeController.delData();
              homeController.getData(keys);
            },
            child: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: homeController.loadedPhotos.length,
        itemBuilder: (BuildContext ctx, index) {
          return ListTile(
            onTap: () {
              homeController.saveValue(
                  keys, homeController.loadedPhotos[index]['title'].toString());
              homeController.getData(keys);
            },
            leading: Image.network(
                homeController.loadedPhotos[index]['thumbnailUrl'].toString()),
            title:
                Text('Title: ' + homeController.loadedPhotos[index]['title']),
            subtitle:
                Text('Photo ID: ${homeController.loadedPhotos[index]["id"]}'),
          );
        },
      ),
    );
  }
}
