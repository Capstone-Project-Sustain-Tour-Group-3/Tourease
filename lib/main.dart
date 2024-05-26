import 'package:flutter/material.dart';
import 'package:get/get.dart';
<<<<<<< HEAD
import 'package:tourease/pages/personalized_recommendation/personalized_page_welcome.dart';
import 'package:tourease/pages/splash/splash_page.dart'; 

=======
import 'package:tourease/pages/splash/splash_page.dart';
>>>>>>> c4f00d268fc8d8f5ba9735b1a973f19d79a92930

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
<<<<<<< HEAD
      home: PersonalizedWelcomePage(),
=======
      home: SplashPage(),
>>>>>>> c4f00d268fc8d8f5ba9735b1a973f19d79a92930
    );
  }
}
