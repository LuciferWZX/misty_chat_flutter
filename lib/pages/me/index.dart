import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:misty_chat/utils/color.util.dart';
import 'package:misty_chat/widgets/list_item/index.dart';
import 'package:misty_chat/widgets/rflutter_alert/src/alert.dart';
import 'package:misty_chat/widgets/rflutter_alert/src/alert_style.dart';
import 'package:misty_chat/widgets/rflutter_alert/src/constants.dart';
import 'package:misty_chat/widgets/rflutter_alert/src/dialog_button.dart';

import '../../controllers/app.controller.dart';
import '../../widgets/normal_list_item/index.dart';

class MePage extends StatefulWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  final appController = Get.put<AppController>(AppController());
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
    String src = "https://img2.baidu.com/it/u=3650686799,1942032122&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1668790800&t=2c279653d74e825ccda477205f73f7d7";
    String title="Daniel";
    String desc ="+14844578842";
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
          child: GFButton(
            onPressed: ()async{
              await Alert(
                context: context,
                title: "退出登录？",
                image: Icon(Icons.logout,color: ColorsUtil.hexStringColor("#1B72C0")),
                desc: "退出后不会删除任何历史数据，下次登录依然可以使用本账号。",
                style: AlertStyle(
                    animationType: AnimationType.fromBottom,
                  descStyle: TextStyle(
                    color: ColorsUtil.hexStringColor("#44474E"),
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                  ),
                  titleStyle: TextStyle(
                    color: ColorsUtil.hexStringColor("#1C1B1F"),
                    fontSize: 24,
                    fontWeight: FontWeight.w400
                  )
                ),
                buttons: [
                  DialogButton(
                    onPressed: () => Navigator.pop(context),
                    color: Colors.transparent,
                    child: Text(
                      "取消",
                      style: TextStyle(
                          color: ColorsUtil.hexStringColor("#1B72C0"),
                          fontSize: 14
                      ),
                    ),
                  ),
                  DialogButton(
                    onPressed: (){
                      Navigator.pop(context);
                      Future.delayed(Duration(seconds: 1),()=>appController.setToken(""));
                    },
                    color: Colors.transparent,
                    child: const Text(
                      "退出登录",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 14
                      ),
                    ),
                  )
                ],
              ).show();
              // CoolAlert.show(
              //   context: context,
              //   title: "你确定要退出吗？",
              //   type: CoolAlertType.confirm,
              //   text: '退出后不会删除任何历史数据，下次登录依然可以使用本账号。',
              //   confirmBtnText: '退出登录',
              //   cancelBtnText: '取消',
              //   confirmBtnColor: Colors.red,
              // );
            },
            text: "退出登录",
            color: GFColors.DANGER,
            type: GFButtonType.solid,
          ),
        )
    );
  }
}
