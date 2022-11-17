import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:misty_chat/utils/color.util.dart';
import 'package:misty_chat/widgets/list_item/index.dart';

import '../../widgets/normal_list_item/index.dart';

class MePage extends StatefulWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    Color iconColor = ColorsUtil.hexStringColor("#1B72C0");
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
                ), NormalListItem(
                  onTap: (){},
                  prefix: Icon(Icons.dark_mode_outlined,color: iconColor),
                  title: "外观",
                ), NormalListItem(
                  onTap: (){},
                  prefix: Icon(Icons.lock_outline_rounded,color: iconColor),
                  title: "隐私",
                ),NormalListItem(
                  onTap: (){},
                  prefix: Icon(Icons.cloud_queue_rounded,color: iconColor),
                  title: "数据和存储",
                ),NormalListItem(
                  onTap: (){},
                  prefix: Icon(Icons.help_outline_rounded,color: iconColor),
                  title: "关于",
                )
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
}
