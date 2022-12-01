import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misty_chat/controllers/contact.controller.dart';
import 'package:misty_chat/entities/friend_request.dart';
import 'package:misty_chat/utils/color.util.dart';

import 'friend_list_item.dart';

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
      body: Obx(()=>ListView.builder(
        itemCount:contactController.friendRequestList.length ,
        itemBuilder: (BuildContext context, int index) {
          FriendRequest friendRequest = contactController.friendRequestList[index];
          FriendInfo friendInfo = friendRequest.friendInfo!;
          String desc = friendRequest.senderDesc ?? "";
          if(friendInfo.id == friendRequest.receiverId){
            desc = "我：$desc";
          }
          Widget action = Text(getRecordStatus(friendRequest.responseStatus));
          if(friendRequest.senderId == friendInfo.id && friendRequest.responseStatus == 2){
            ///说明我是接收人
            action = Column(
              children: [
                ElevatedButton(
                    onPressed: (){
                      // contactController.handleFriendRequest(friendRequest.id, friendInfo.id, 1);
                      contactController.handleFriendRequest(
                          fRecordId: friendRequest.id,
                          fid:  friendInfo.id,
                          status: 1,
                          senderRemark: friendRequest.senderDesc
                      );
                    },
                    child: const Text("接受")
                ),
                TextButton(
                    onPressed: (){
                      // contactController.handleFriendRequest(friendRequest.id, friendInfo.id, 1);
                      contactController.handleFriendRequest(
                          fRecordId: friendRequest.id,
                          fid:  friendInfo.id,
                          status: 0,
                      );
                    },
                    child: const Text("拒绝",style: TextStyle(color: Colors.red),)
                ),
              ],
            );
          }
          return FriendListItem(
            nickname: friendInfo.nickname,
            username: friendInfo.username,
            avatar: friendInfo.avatar,
            desc: desc,
            showDivider: index<contactController.friendRequestList.length,
            action: action,
          );
        },
      )),
    );
  }

  String getRecordStatus(int responseStatus){
    String status = "等待对方接受";
    switch (responseStatus){
      case  0:{
        status = "以拒绝";
        break;
      }
      case 1:{
        status = "已接受";
        break;
      }
    }
    return status;
  }
}
