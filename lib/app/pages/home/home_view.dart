import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Secure Storage',
      home: HomeScreen(),
    );
  }
}
