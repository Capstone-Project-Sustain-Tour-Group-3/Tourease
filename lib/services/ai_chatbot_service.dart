import 'package:get/get.dart';
import 'package:tourease/pages/login/login_page.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:tourease/utils/shared_preference_utils.dart';
import 'package:tourease/services/refresh_token_and_logout_service.dart';

class AiChatbotService {
  late WebSocketChannel _channel;
  final String _webSocketUrl = 'wss://api.tourease.my.id/v1/mobile/chatbot';

  Function(dynamic)? onMessageReceived;
  Function? onError;
  Function? onConnectionClosed;

  AiChatbotService(
      {this.onMessageReceived, this.onError, this.onConnectionClosed});

  Future<void> connectWebSocket() async {
    try {
      final response = await RefreshTokenLogoutService().postRefreshToken();
      if (response == true) {
        String? token = await SharedPref.getAccessToken();
        _channel = IOWebSocketChannel.connect(
          Uri.parse(_webSocketUrl),
          headers: {
            'Authorization': 'Bearer $token',
          },
        );

        _channel.stream.listen(
          (data) {
            if (onMessageReceived != null) onMessageReceived!(data);
          },
          onError: (error) async {
            if (onError != null) {
              await _handleError();
            }
          },
          onDone: () {
            if (onConnectionClosed != null) onConnectionClosed!();
          },
        );
      }
    } catch (e) {
      if (onError != null) _handleError();
    }
  }

  Future<void> reconnectWebSocket() async {
    try {
      await _channel.sink.close();
      final response = await RefreshTokenLogoutService().postRefreshToken();
      if (response == true) {
        String? newToken = await SharedPref.getAccessToken();
        _channel = IOWebSocketChannel.connect(
          Uri.parse(_webSocketUrl),
          headers: {
            'Authorization': 'Bearer $newToken',
          },
        );

        _channel.stream.listen(
          (data) {
            if (onMessageReceived != null) onMessageReceived!(data);
          },
          onError: (error) {
            if (onError != null) {
              _handleError();
            }
          },
          onDone: () {
            if (onConnectionClosed != null) onConnectionClosed!();
          },
        );
      }
    } catch (e) {
      if (onError != null) _handleError();
    }
  }

  Future<void> _handleError() async {
    bool tokenRefreshed = await RefreshTokenLogoutService().postRefreshToken();
    if (tokenRefreshed) {
      await reconnectWebSocket();
    } else {
      if (onError != null) {
        onError!('Sesi telah berakhir, tolong login kembali');
        Get.offAll(LoginPage(
          showIconButton: false,
        ));
      }
    }
  }

  void sendMessage(String message) {
    _channel.sink.add(message);
  }

  void close() {
    _channel.sink.close();
  }
}
