import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/services/ai_chatbot_service.dart';
import 'package:tourease/widgets/snackbar_widget.dart';

class AiChatbotController extends GetxController {
  late AiChatbotService _aiChatbotService;

  final RxList<ChatMessage> messages = <ChatMessage>[].obs;
  final RxList<ChatUser> typingList = <ChatUser>[].obs;

  RxBool pageDibuka = true.obs;

  final errorMessage = Rxn<String>();

  @override
  void onInit() {
    super.onInit();
    pageDibuka.value = true;

    _aiChatbotService = AiChatbotService(
      onMessageReceived: _onMessageReceived,
      onError: _onError,
      onConnectionClosed: _onConnectionClosed,
    );

    _aiChatbotService.connectWebSocket();

    ever(errorMessage, (String? message) {
      if (message != null && message.isNotEmpty) {
        SnackbarWidget.showSnackbar(
          message: message,
          backgroundColor: Colors.transparent,
          textContainerColor: Colors.transparent,
          textColor: ColorDanger.danger500,
        );
      }
    });
  }

  @override
  void onClose() {
    _aiChatbotService.close();
    pageDibuka.value = false;
    super.onClose();
  }

  AiChatbotController() {
    messages.add(
      ChatMessage(
        text: 'Hai saya travel assistant mu!👋\nBagaimana saya dapat membantu?',
        user: ChatUser(
          id: '1',
          firstName: 'Travel Assistant',
          profileImage: AssetsCollection.chatbotIcon,
        ),
        createdAt: DateTime.now(),
      ),
    );
  }

  ChatUser currentUser = ChatUser(
    id: '0',
    firstName: 'Eqi',
  );
  ChatUser aiUser = ChatUser(
    id: '1',
    firstName: 'Travel Assistant',
    profileImage: AssetsCollection.chatbotIcon,
  );

  String removeAsterisks(String text) {
    return text.replaceAll('*', '');
  }

  void _onMessageReceived(dynamic data) {
    typingList.removeAt(0);
    final messageText = removeAsterisks(data.toString());
    final message = ChatMessage(
      text: messageText,
      user: aiUser,
      createdAt: DateTime.now(),
    );
    messages.insert(0, message);
  }

  void _onError(dynamic error) {
    errorMessage.value = error.toString();
  }

  void sendMessage(ChatMessage messageText) {
    messages.insert(0, messageText);
    _aiChatbotService.sendMessage(messageText.text);
    typingList.add(aiUser);
  }

  void _onConnectionClosed() {
    if (pageDibuka.value) {
      _aiChatbotService.reconnectWebSocket();
    } else {
      _aiChatbotService.close();
    }
  }
}