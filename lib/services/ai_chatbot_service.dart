import 'dart:async';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  late WebSocketChannel _channel;
  final String _webSocketUrl = 'wss://api.tourease.my.id/v1/mobile/chatbot';

  Future<void> connectWebSocket(String token) async {
    _channel = IOWebSocketChannel.connect(
      Uri.parse(_webSocketUrl),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
  }

  void sendMessage(String messageText) {
    _channel.sink.add(messageText);
  }

  Stream<dynamic> get messageStream => _channel.stream;

  void closeWebSocket() {
    _channel.sink.close();
  }
}
