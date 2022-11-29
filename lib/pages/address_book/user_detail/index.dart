import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:misty_chat/controllers/user.controller.dart';
import 'package:misty_chat/routes/index.dart';
import 'package:misty_chat/utils/color.util.dart';
import 'package:misty_chat/widgets/normal_list_item/index.dart';

class UserDetailPage extends StatelessWidget {
  UserDetailPage({Key? key}) : super(key: key);
  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsUtil.hexStringColor("#FCFCFF"),
        elevation: 0,
        leading: IconButton(
            onPressed: (){},
            color: Colors.black,
            icon: const Icon(Icons.arrow_back_rounded)
        ),
        actions: [
          IconButton(
              onPressed: (){},
              color: Colors.black,
              icon: const Icon(Icons.more_vert_rounded)
          )
        ],
      ),
      backgroundColor: ColorsUtil.hexStringColor("#FCFCFF"),
      body: ListView(
        shrinkWrap: false,
        children:[
          Flex(
            direction: Axis.vertical,
            children: [
              GFAvatar(
                  size: 120,
                  backgroundImage:NetworkImage("${userController.user.value.avatar}" ?? "")
              ),
              const SizedBox(height: 24),
              Text(
                  "${userController.user.value.nickname}",
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 32
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "${userController.user.value.username}",
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                ),
              ),
              const SizedBox(height: 8,),
              NormalListItem(
                onTap: (){
                  Get.toNamed(RoutePath.requestFriend);
                },
                prefix: Icon(Icons.add_outlined),
                title: "添加好友",
              ),
            ],
          )
        ],
      ),
    );
  }
}
