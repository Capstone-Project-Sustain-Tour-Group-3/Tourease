import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/pages/ai_chatbot/ai_chatbot_onboarding_page.dart';
import 'package:tourease/pages/destinasi/destinasi_search_page.dart';
import 'package:tourease/widgets/search_text_form_field_widget.dart';

class HomeSearchVa extends StatelessWidget {
  const HomeSearchVa({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Get.to(() => const DestinasiSearchPage());
              },
              child: AbsorbPointer(
                child: SearchTextFormFieldWidget(
                  readOnly: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: ColorNeutral.neutral500,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => const AiChatbotOnboarding());
            },
            child: Container(
              width: 47.5,
              height: 47.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: ColorPrimary.primary500,
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  AssetsCollection.chatbotIconSvg,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
