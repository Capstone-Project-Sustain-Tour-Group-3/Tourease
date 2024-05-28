import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';

class ProfilLogoutContainerWidget extends StatelessWidget {
  const ProfilLogoutContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 48,
        margin: const EdgeInsets.only(
          bottom: 16,
          left: 16,
          right: 16,
        ),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            children: [
              SvgPicture.asset(
                AssetsCollection.logout,
                width: 24,
                height: 24,
              ),
              Container(
                width: 208,
                height: 22,
                margin: const EdgeInsets.only(left: 16),
                child: AutoSizeText(
                  'Keluar',
                  style: TextStyleCollection.captionMedium
                      .copyWith(color: ColorDanger.danger500),
                  minFontSize: 14,
                  maxFontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
