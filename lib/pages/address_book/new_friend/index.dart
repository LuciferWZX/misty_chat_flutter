import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misty_chat/controllers/contact.controller.dart';
import 'package:misty_chat/utils/color.util.dart';

class NewFriendPage extends StatefulWidget {
  const NewFriendPage({Key? key}) : super(key: key);

  @override
  State<NewFriendPage> createState() => _NewFriendPageState();
}

class _NewFriendPageState extends State<NewFriendPage> {
  ContactController contactController = Get.find<ContactController>();
  @override
  void initState() {

    // TODO: implement initState
    contactController.getFriendRequestList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
            "新朋友",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500
            )),
        backgroundColor: ColorsUtil.hexStringColor("#fafafa"),
        elevation: 0,
        leading: IconButton(
            onPressed: (){
              Get.back();
            },
            color: Colors.black,
            icon: const Icon(Icons.keyboard_arrow_left)
        ),
      ),
      body: Obx(()=>ListView(
        children: contactController.friendRequestList.value.map((fRecord) => Text("${fRecord.friendInfo?.nickname}")).toList(),
      )),
    );
  }
}
