import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misty_chat/controllers/app.controller.dart';
import 'package:misty_chat/pages/message/search_input.dart';
import 'package:misty_chat/utils/color.util.dart';

import '../../widgets/list_item/index.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final appController = Get.put<AppController>(AppController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsUtil.hexStringColor("#FCFCFF"),
        title: const SearchInput(),
        elevation: 0,
      ),
      backgroundColor: ColorsUtil.hexStringColor("#FCFCFF"),
      body: ListView(
        children: const [
          ListItem(),
          ListItem(),
          ListItem(),
          ListItem(),
          ListItem(),
          ListItem(),
          ListItem(),
          ListItem(),
          ListItem(),
          SizedBox(height: 10)
        ],
      )
    );
  }
}
