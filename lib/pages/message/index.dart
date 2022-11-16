import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misty_chat/controllers/app.controller.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Obx(()=>Text("消息:${appController.token}")),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            appController.setToken("");
          },
          child: Text("清除token"),
        ),
      ),
    );
  }
}
