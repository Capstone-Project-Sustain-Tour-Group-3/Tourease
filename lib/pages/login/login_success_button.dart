import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/pages/home/home_page.dart';
import 'package:tourease/widgets/button_widget.dart';

class LoginSuccessButton extends StatelessWidget {
  const LoginSuccessButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ButtonWidget(
          onPressed: () {
            Get.off(() => const HomePage());
          },
          text: 'Mulai',
          textColor: ColorNeutral.neutral100,
        ),
      ),
    );
  }
}
