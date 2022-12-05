import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misty_chat/controllers/contact.controller.dart';
import 'package:misty_chat/entities/contact_user.dart';
import 'package:misty_chat/pages/address_book/contact.dart';
import 'package:misty_chat/routes/index.dart';

import 'package:misty_chat/utils/color.util.dart';
import 'package:misty_chat/widgets/normal_list_item/index.dart';
import 'package:misty_chat/widgets/search_input/index.dart';

class AddressBookPage extends StatefulWidget {
  const AddressBookPage({Key? key}) : super(key: key);

  @override
  State<AddressBookPage> createState() => _AddressBookPageState();
}

class _AddressBookPageState extends State<AddressBookPage> {
  final FocusNode focusNode = FocusNode();
  final ContactController contactController = Get.find<ContactController>();
  @override
  void initState() {
    contactController.getFriendsList();
    focusNode.unfocus();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    focusNode.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: ColorsUtil.hexStringColor("#FCFCFF"),
        elevation: 0,
        title: const Text(
          "联系人",
          style: TextStyle(
              color: Colors.black87,
            fontWeight: FontWeight.w500,
            fontSize: 24
          )),
        actions: [
          IconButton(
              onPressed: (){},
              color: Colors.black,
              icon: const Icon(Icons.more_vert)
          )
        ],
      ),
      backgroundColor: ColorsUtil.hexStringColor("#FCFCFF"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16,top: 10,right: 16,bottom: 10),
            child: SearchInput(
              enabled: false,
              onTap: (){
                Get.toNamed(RoutePath.searchUser);
              },
            ),
          ),
          NormalListItem(
            onTap: (){
              Get.toNamed(RoutePath.newFriend);
            },
            prefix:Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(Radius.circular(6))
              ),
              child:const Center(
                child: const Icon(Icons.group_add,color: Colors.white,),
              ),
            ),
            title: "好友请求",
          ),
          Expanded(
              child: Obx(()=>Contact(
                contactList: contactController.friendsList.value,
              ))
          )
        ],
      ),
    );
  }
}
