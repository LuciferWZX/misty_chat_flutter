import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:misty_chat/pages/address_book/request_friend/form_item.dart';
import 'package:misty_chat/utils/color.util.dart';

class RequestFriendPage extends StatelessWidget {
  const RequestFriendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "申请添加朋友",
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
        actions: [
          IconButton(
              onPressed: (){},
              color: Colors.black,
              icon: const Icon(Icons.more_vert_rounded)
          )
        ],
      ),
      body: Container(
        color: ColorsUtil.hexStringColor("#fafafa"),
        padding:const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 10,
          bottom: 10
        ),
        child: ListView(
          children: [
            // 多行文本输入框
            FormItem(
              label: "发送添加朋友申请",
              child:Container(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15
                ),
                decoration: BoxDecoration(
                  color: ColorsUtil.hexStringColor("#f0f0f0"),
                  borderRadius: const BorderRadius.all(Radius.circular(5))
                ),
                child: TextField(
                    keyboardType: TextInputType.multiline,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(50)
                    ],
                    maxLines: 3,
                    decoration:const InputDecoration(
                      // isCollapsed: true,
                      // contentPadding: EdgeInsets.only( left: 20,right: 20),
                        hintText: "请输入多行文本",
                        border: InputBorder.none
                    )
                ),
              )
            ),

          ],
        ),
      ),
    );
  }
}
