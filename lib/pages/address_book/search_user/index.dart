import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misty_chat/controllers/contact.controller.dart';
import 'package:misty_chat/utils/color.util.dart';
import 'package:misty_chat/widgets/search_input/index.dart';

class SearchUserPage extends StatelessWidget {
  SearchUserPage({Key? key}) : super(key: key);
  ContactController contactController = Get.put(ContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: ColorsUtil.hexStringColor("#FCFCFF"),
        title: SearchInput(
          textEditingController: contactController.textController,
          autoFocus: true,
        ),
        elevation: 0,
      ),
      backgroundColor: ColorsUtil.hexStringColor("#FCFCFF"),
      body: Obx(()=>ListView(
        children: contactController.userList.value.map((element) => Text("${element.nickname}")).toList(),
      )),
    );
  }
}
