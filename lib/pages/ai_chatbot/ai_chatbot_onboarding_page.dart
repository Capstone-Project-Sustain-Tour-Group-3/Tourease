import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/status_bar_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/pages/ai_chatbot/ai_chatbot_page.dart';
import 'package:tourease/widgets/button_widget.dart';

class AiChatbotOnboarding extends StatelessWidget {
  const AiChatbotOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    StatusBarConstant.statusBar;

    return Scaffold(
        body: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AssetsCollection.chatbot,
                height: 214,
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    AutoSizeText(
                      'Travel Assistant Siap Membantu!',
                      style: TextStyleCollection.bodyBold.copyWith(
                        color: ColorPrimary.primary900,
                      ),
                      minFontSize: 18,
                      maxFontSize: 20,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    AutoSizeText(
                      'Tanyakan semua pertanyaanmu, chatbot akan menjawab 24/7',
                      style: TextStyleCollection.caption.copyWith(
                        color: ColorPrimary.primary900,
                      ),
                      minFontSize: 14,
                      maxFontSize: 16,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 24,
          left: 19.5,
          right: 19.5,
          child: SizedBox(
            width: double.infinity,
            height: 48,
            child: ButtonWidget(
              onPressed: () {
                Get.off(
                  () => const AiChatbotPage(),
                );
              },
              text: 'Chat Travel Assistant',
              textColor: ColorNeutral.neutral100,
            ),
          ),
        )
      ],
    ));
  }
}
