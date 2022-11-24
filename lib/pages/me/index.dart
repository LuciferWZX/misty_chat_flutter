
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:misty_chat/controllers/app.controller.dart';
import 'package:misty_chat/entities/user.dart';
import 'package:misty_chat/utils/color.util.dart';
import 'package:misty_chat/utils/loading.util.dart';
import 'package:misty_chat/widgets/list_item/index.dart';

import '../../widgets/normal_list_item/index.dart';

class MePage extends StatefulWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  final appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    Color iconColor = ColorsUtil.hexStringColor("#1B72C0");

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: (){},
              color: Colors.black,
              icon: const Icon(Icons.search)
          ),
          IconButton(
              onPressed: (){},
              color: Colors.black,
              icon: const Icon(Icons.more_vert)
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Flex(
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle(),
          Expanded(
            child: ListView(
              children: [
                buildUserInfo(),
                buildSubtitle(),
                NormalListItem(
                  onTap: (){},
                  prefix: Icon(Icons.notifications_none_rounded,color: iconColor),
                  title: "通知",
                ),
                NormalListItem(
                  onTap: (){},
                  prefix: Icon(Icons.dark_mode_outlined,color: iconColor),
                  title: "外观",
                ),
                NormalListItem(
                  onTap: (){},
                  prefix: Icon(Icons.lock_outline_rounded,color: iconColor),
                  title: "隐私",
                ),
                NormalListItem(
                  onTap: (){},
                  prefix: Icon(Icons.cloud_queue_rounded,color: iconColor),
                  title: "数据和存储",
                ),
                NormalListItem(
                  onTap: (){},
                  prefix: Icon(Icons.help_outline_rounded,color: iconColor),
                  title: "关于",
                ),
                buildLogoutBtn()
              ],
            )
          )
        ],
      )
    );
  }

  Widget buildTitle(){
    return const Padding(
      padding: EdgeInsets.only(left: 16,top: 16,right: 16,bottom: 20),
      child:  Text(
          "设置",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24
          )),
    );
  }
  Widget buildUserInfo(){
    User user = appController.user.value;
    String src = user.avatar ?? "";
    String title=user.username ?? "";
    String desc ="+${user.phone}";
    return(
        ListItem(
          imgSrc: src,
          title: title,
          desc: desc,
          action: GFButton(
            onPressed: (){},
            shape: GFButtonShape.pills,
            color: ColorsUtil.hexStringColor("#D3E4FF"),
            textStyle: TextStyle(
              color: ColorsUtil.hexStringColor("#1B1C1F"),
              fontWeight: FontWeight.w500
            ),
            text: "编辑",
          ),
        )
    );
  }
  Widget buildSubtitle(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
      child: Text(
        "通常",
        style: TextStyle(
          color: ColorsUtil.hexStringColor("#1B72C0"),
          fontWeight: FontWeight.w500,
          fontSize: 14
        )
      ),
    );
  }
  Widget buildLogoutBtn(){
    return(
        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: ElevatedButton(
            style: ButtonStyle(
              //背景颜色
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  //设置按下时的背景颜色
                  // if (states.contains(MaterialState.pressed)) {
                  //   return Colors.blue[200];
                  // }
                  //默认不使用背景颜色
                  return Colors.red;
                })
            ),
            onPressed: ()async{
              // CoolAlert.show(
              //   context: context,
              //   title: "你确定要退出吗？",
              //   type: CoolAlertType.confirm,
              //   text: '退出后不会删除任何历史数据，下次登录依然可以使用本账号。',
              //   confirmBtnText: '退出登录',
              //   cancelBtnText: '取消',
              //   onConfirmBtnTap: ()async{
              //       Navigator.pop(context);
              //       await LoadingUtil.showLoading();
              //       appController.setToken("");
              //   },
              //   confirmBtnColor: Colors.red,
              // );
              _showDialogFlash();
            },
            child: const Text("退出登录"),
          ),
        )
    );
  }
  void _showDialogFlash({bool persistent = true}) {
    context.showFlashDialog(
        constraints: const BoxConstraints(maxWidth: 300),
        persistent: persistent,
        // transitionDuration: const Duration(seconds: 1),
        title: const Text('你确定要退出吗?'),
        content: const Text('退出后不会删除任何历史数据，下次登录依然可以使用本账号。'),
        negativeActionBuilder: (context, controller, _) {
          return TextButton(
            onPressed: (){
              controller.dismiss();
            },
            child: const Text('取消'),
          );
        },
        positiveActionBuilder: (context, controller, _) {
          return TextButton(
              onPressed: () async{
                controller.dismiss();
                await LoadingUtil.showLoading();
                appController.setToken("");
              },
              child: const Text('退出登录',style: TextStyle(color: Colors.red),));
        });
  }
}
