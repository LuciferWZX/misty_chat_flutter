import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:misty_chat/controllers/app.controller.dart';
import 'package:misty_chat/controllers/user.controller.dart';
import 'package:misty_chat/pages/address_book/request_friend/form_item.dart';
import 'package:misty_chat/routes/index.dart';
import 'package:misty_chat/utils/color.util.dart';
import 'package:misty_chat/utils/router.util.dart';

class RequestFriendPage extends StatelessWidget {
  RequestFriendPage({Key? key}) : super(key: key);
  UserController userController = Get.find<UserController>();
  AppController appController = Get.find<AppController>();
  String? senderDesc="";
  String? senderRemark="";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
        child: Form(
          key: _formKey,
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
                    child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        initialValue: "我是${appController.user.value.nickname}",
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(50)
                        ],
                        onSaved: (val){
                          senderDesc=val!;
                        },
                        maxLines: 3,
                        decoration:const InputDecoration(
                          // isCollapsed: true,
                          // contentPadding: EdgeInsets.only( left: 20,right: 20),
                            border: InputBorder.none
                        )
                    ),
                  )
              ),
              const SizedBox(height: 8),
              FormItem(
                  label: "设置备注",
                  child:Container(
                    padding: const EdgeInsets.only(
                        left: 15,
                        right: 15
                    ),
                    decoration: BoxDecoration(
                        color: ColorsUtil.hexStringColor("#f0f0f0"),
                        borderRadius: const BorderRadius.all(Radius.circular(5))
                    ),
                    child: TextFormField(
                      initialValue: userController.user.value.nickname,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(20)
                        ],
                        decoration:const InputDecoration(
                          // isCollapsed: true,
                          // contentPadding: EdgeInsets.only( left: 20,right: 20),
                            hintText: "备注",
                            border: InputBorder.none
                        ),
                      onSaved: (val){
                        senderRemark=val;
                      },
                    ),
                  )
              ),

            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: SizedBox(
          width: 200,
          child: ElevatedButton(

            onPressed: ()async {
              _formKey.currentState?.save();
              bool res = await userController.sendFriendRequest(userController.user.value.id!,senderDesc, senderRemark);
              print("111:$res");
              if(res){
                RouterUtil.goBackPath(path: RoutePath.home);
              }
            },
            child: Text("发送"),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
