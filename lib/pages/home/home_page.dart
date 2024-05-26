import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';

import 'package:tourease/pages/home/home_header.dart';
import 'package:tourease/pages/home/home_search_and_va.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorNeutral.neutral50,
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 22.5,
              ),
              HomeHeader(),
              SizedBox(
                height: 22.5,
              ),
              HomeSearchVa(),
            ],
          ),
        ),
      ),
    );
  }
}
