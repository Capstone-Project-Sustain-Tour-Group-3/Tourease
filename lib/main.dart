import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/pages/home/home_page.dart';
import 'package:tourease/pages/saved_route/saved_route_page_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SavedRouteHomePage(),
    );
  }
}
