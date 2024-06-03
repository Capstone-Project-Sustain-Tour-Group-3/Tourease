import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/assets_constant.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/services/refresh_token_and_logout_service.dart';
import 'package:tourease/utils/shared_preference_utils.dart';
import 'package:tourease/widgets/snackbar_widget.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class AiChatbotController extends GetxController {
  late WebSocketChannel _channel;
  final String _webSocketUrl = 'wss://api.tourease.my.id/v1/mobile/chatbot';

  final RxList<ChatMessage> messages = <ChatMessage>[].obs;
  final RxList<ChatUser> typingList = <ChatUser>[].obs;

  final connected = Rxn<String>();
  final errorMessage = Rxn<String>();

  @override
  void onInit() {
    super.onInit();
    _connectWebSocket();

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

    ever(connected, (String? status) {
      if (status != null && status.isNotEmpty) {
        SnackbarWidget.showSnackbar(
          message: status,
          backgroundColor: ColorDanger.danger100,
          textContainerColor: Colors.transparent,
          textColor: ColorDanger.danger500,
        );
      }
    });
  }

  @override
  void onClose() {
    _channel.sink.close();

    super.onClose();
  }

  AiChatbotController() {
    _connectWebSocket();
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

  void _connectWebSocket() async {
    String? token = await SharedPref.getAccessToken();
    _channel = IOWebSocketChannel.connect(
      Uri.parse(_webSocketUrl),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    _channel.stream.listen(
      (data) {
        _onMessageReceived(data);
      },
      onError: (error) async {
        // Attempt to refresh token
        bool tokenRefreshed =
            await RefreshTokenLogoutService().postRefreshToken();
        if (tokenRefreshed) {
          // If token refreshed successfully, reconnect WebSocket
          _reconnectWebSocket();
        } else {
          errorMessage.value = 'Refresh token gagal, silahkan login kembali';
        }
      },
    );
  }

  void _reconnectWebSocket() async {
    // Close existing connection
    await _channel.sink.close();
    // Reconnect with new token
    String? newToken = await SharedPref.getRefreshToken();
    _channel = IOWebSocketChannel.connect(
      Uri.parse(_webSocketUrl),
      headers: {
        'Authorization': 'Bearer $newToken',
      },
    );

    _channel.stream.listen(
      (data) {
        _onMessageReceived(data);
      },
      onError: (error) {
        errorMessage.value = 'Sesi anda telah berakhir, silahkan login kembali';
      },
    );
  }

  void _onMessageReceived(dynamic data) {
    // Remove loading
    typingList.removeAt(0);

    final messageText = removeAsterisks(data.toString()); // Clean the message
    final message = ChatMessage(
      text: messageText,
      user: aiUser,
      createdAt: DateTime.now(),
    );
    messages.insert(0, message);
  }

  void sendMessage(ChatMessage messageText) {
    messages.insert(0, messageText);
    _channel.sink.add(messageText.text);
    typingList.add(aiUser);
    // Add loading message
  }
}
