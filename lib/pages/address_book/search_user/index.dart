import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misty_chat/controllers/contact.controller.dart';
import 'package:misty_chat/entities/user.dart';
import 'package:misty_chat/pages/address_book/contact.dart';
import 'package:misty_chat/utils/color.util.dart';
import 'package:misty_chat/widgets/list_item/index.dart';
import 'package:misty_chat/widgets/normal_list_item/index.dart';
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
      body: Obx(()=>ListView.builder(
        itemCount: contactController.userList.length,
        itemBuilder: (BuildContext context,int index){
          User user = contactController.userList[index];
          return  ListItem(
            onTap: (){
              debugPrint("点击了:${user.id}");
            },
            imgSrc: user.avatar ?? "",
            title: user.nickname ?? "",
            desc: user.username ?? "",
            slidable: false,
            action: Container(),
          );
        },
      )),
    );
  }
}
