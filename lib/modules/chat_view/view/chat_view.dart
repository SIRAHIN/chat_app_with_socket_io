import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_chat_app/modules/chat_view/controller/chat_view_controller.dart';

class ChatView extends GetView<ChatViewController> {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Socket.IO Chat'),
        actions: [
          Obx(() => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              controller.isConnected.value ? Icons.wifi : Icons.wifi_off,
              color: controller.isConnected.value ? Colors.green : Colors.red,
            ),
          )),
        ],
      ),
      body: Column(
        children: <Widget>[
          // Display chat messages
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount:  controller.messages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                   title: Text(controller.messages[index]),
                  );
                },
              );
            }),
          ),
          // Input and send message area
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                 Expanded(
                  child: TextField(
                   controller: controller.messageController,
                    decoration: const InputDecoration(
                      labelText: 'Send a message',
                    ),
                   
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                      var message = controller.messageController.text;
                      controller.messageController.clear();
                      controller.sendMessage(message);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  }