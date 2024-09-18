import 'package:get/get.dart';
import 'package:socket_io_chat_app/modules/chat_view/controller/chat_view_controller.dart';

class ChatViewBinding extends Bindings{
 @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ChatViewController(), fenix: true);
  }
}