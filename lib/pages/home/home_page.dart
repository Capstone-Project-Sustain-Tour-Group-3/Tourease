import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/status_bar_constant.dart';
import 'package:tourease/pages/home/home_container_rute.dart';
import 'package:tourease/pages/home/home_header.dart';
import 'package:tourease/pages/home/home_list_destinasi.dart';
import 'package:tourease/pages/home/home_list_destinasi_populer.dart';
import 'package:tourease/pages/home/home_pilihan_destinasi_untuk_anda.dart';
import 'package:tourease/pages/home/home_search_and_va.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    StatusBarConstant.statusBar;

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
              SizedBox(
                height: 20,
              ),
              HomePilihanDestinasiUntukAnda(),
              SizedBox(
                height: 24,
              ),
              HomeContainerRute(),
              SizedBox(
                height: 24,
              ),
              HomeListDestinasi(),
              SizedBox(
                height: 36,
              ),
              HomeListDestinasiPopuler(),
              SizedBox(
                height: 36,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
