import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/widgets/button_widget.dart';

class ForgetPasswordForEmailButton extends StatelessWidget {
  const ForgetPasswordForEmailButton({super.key});

 @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ButtonWidget(
          onPressed: () {
            
          },
          text: 'Lanjut',
          textColor: ColorNeutral.neutral100,
        ),
      ),
    );
  }
}