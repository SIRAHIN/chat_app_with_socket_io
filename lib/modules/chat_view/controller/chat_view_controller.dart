import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
class ChatViewController  extends GetxController{

  late IO.Socket socket;
  var messages = <String>[].obs; // Observable list to hold chat messages
  var isConnected = false.obs;   // Observable to track connection status
  TextEditingController messageController = TextEditingController();


  @override
  void onInit() {
    connectToSocket();
    super.onInit();
  }

  // Connect to the Socket.IO server
  void connectToSocket() {
    socket = IO.io('http://192.168.0.172:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    
    print(socket.connected);
    
    // socket to connect func //
    socket.connect();

    // Listen for connection
    socket.on('connect', (_) {
      isConnected(true);
      print('Connected to the server');
    });

    print(socket.connected);

    // Listen for incoming messages
    socket.on('receive_message', (message) {
      messages.add(message); // Add new message to the list
    });

    // Handle disconnection
    socket.on('disconnect', (_) {
      isConnected(false);
      print('Disconnected from server');
    });
  }


  // Send a message
  void sendMessage(String message) {
    if (isConnected.value) {
     if(message.isNotEmpty){
       socket.emit('send_message', message); // Emit the message to the server
     }
    } else {
      Get.snackbar('WARNING', 'Message not sent!');
    }
  }

  @override
  void onClose() {
    socket.disconnect(); // Disconnect from the server when the controller is closed
    messageController.clear();
    messageController.dispose();
    super.onClose();
  }

}