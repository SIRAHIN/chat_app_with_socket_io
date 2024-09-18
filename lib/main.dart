import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_chat_app/modules/chat_view/binding/chat_view_binding.dart';
import 'package:socket_io_chat_app/modules/chat_view/view/chat_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: const ChatView(),
      initialBinding: ChatViewBinding(),
    );
  }
}