import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/pages/personalized_recommendation/personalized_page_welcome.dart';
import 'package:tourease/pages/splash/splash_page.dart'; 


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
      home: PersonalizedWelcomePage(),
    );
  }
}
