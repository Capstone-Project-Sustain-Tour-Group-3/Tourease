import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/assets_constant.dart';

class AiChatbotController extends GetxController {
  RxList<ChatMessage> messages = RxList<ChatMessage>();

  AiChatbotController() {
    messages.add(
      ChatMessage(
        text: 'Hai saya travel assistant mu!👋\nBagaimana saya dapat membantu?',
        user: ChatUser(
            id: '1',
            firstName: 'AI',
            profileImage: AssetsCollection.chatbotIcon),
        createdAt: DateTime.now(),
      ),
    );
  }

  void sendMessage(ChatMessage m, ChatUser aiUser) {
    messages.insert(0, m);
  }
}
