import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyleCollection.bodyBold.copyWith(
        fontSize: 16,
        color: ColorNeutral.neutral900,
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;

  const BulletPoint({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 4,
        bottom: 4,
        left: 10,
        right: 5,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: TextStyleCollection.caption.copyWith(
              fontSize: 14,
              color: ColorNeutral.neutral700,
            ),
          ),
          const SizedBox(
            width: 2.5,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyleCollection.caption.copyWith(
                fontSize: 14,
                color: ColorNeutral.neutral700,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
