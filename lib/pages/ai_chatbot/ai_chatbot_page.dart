import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/status_bar_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:tourease/controllers/ai_chatbot_controller.dart';

class AiChatbotPage extends StatefulWidget {
  const AiChatbotPage({super.key});

  @override
  State<AiChatbotPage> createState() => _AiChatbotPageState();
}

class _AiChatbotPageState extends State<AiChatbotPage> {
  @override
  Widget build(BuildContext context) {
    StatusBarConstant.statusBar;

    final AiChatbotController aiChatbotController = Get.put(
      AiChatbotController(),
    );

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        titleSpacing: 8,
        toolbarHeight: 64,
        leadingWidth: 40,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8, top: 12, bottom: 12),
          child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: 24.0,
                color: ColorPrimary.primary500,
              ), // Set desired size
              onPressed: () => Get.back()),
        ),
        title: Container(
          height: 40,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                AssetsCollection.chatbotIconSvg,
                width: 40,
                height: 40,
              ),
              const SizedBox(
                width: 9,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Travel Assistant',
                    style: TextStyleCollection.bodyBold.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorCollection.active),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Align(
                        child: Text(
                          'aktif selalu',
                          style: TextStyleCollection.bodyMedium.copyWith(
                              fontSize: 12, color: ColorCollection.gray),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      body: Obx(
        () => DashChat(
          typingUsers: aiChatbotController.typingList,
          currentUser: aiChatbotController.currentUser,
          messages: aiChatbotController.messages.toList(),
          messageOptions: MessageOptions(
            messageTextBuilder: (message, previousMessage, nextMessage) {
              return Text(
                message.text,
                style: TextStyleCollection.caption.copyWith(
                  color: message.user.id == '0' ? Colors.white : Colors.black,
                  fontSize: 14,
                ),
              );
            },
            showTime: false,
            maxWidth: 277,
            borderRadius: 24,
            textColor: Colors.black,
            currentUserContainerColor: ColorPrimary.primary400,
            messagePadding: const EdgeInsets.all(16),
            containerColor: ColorNeutral.neutral100,
          ),
          inputOptions: InputOptions(
              sendButtonBuilder: (send) {
                return GestureDetector(
                  onTap: send,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: SvgPicture.asset(
                      AssetsCollection.sendIcon,
                      width: 27,
                      height: 27,
                    ),
                  ),
                );
              },
              alwaysShowSend: true,
              inputToolbarMargin: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 26,
              ),
              inputTextStyle:
                  TextStyleCollection.caption.copyWith(fontSize: 12),
              inputDecoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(48),
                    borderSide:
                        BorderSide(color: ColorCollection.gray1, width: 1.5),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(48),
                    borderSide:
                        BorderSide(color: ColorCollection.gray1, width: 1.5),
                  ),
                  hintText: 'Tanyakan sesuatu...',
                  hintStyle:
                      TextStyleCollection.caption.copyWith(fontSize: 14))),
          onSend: (ChatMessage m) {
            aiChatbotController.sendMessage(m);
          },
        ),
      ),
    );
  }
}
