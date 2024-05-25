import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';

class LoginBanner extends StatelessWidget {
  const LoginBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 44),
          const Text(
            'Masuk Akun',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Ayo! ciptakan perjalanan impianmu.',
            style: TextStyleCollection.caption.copyWith(
              fontSize: 14,
              color: ColorNeutral.neutral700,
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
