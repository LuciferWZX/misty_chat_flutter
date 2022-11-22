import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:misty_chat/controllers/app.controller.dart';
import 'package:misty_chat/pages/message/search_input.dart';
import 'package:misty_chat/utils/color.util.dart';

import '../../widgets/list_item/index.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final appController = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    String src = "https://img2.baidu.com/it/u=3650686799,1942032122&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1668790800&t=2c279653d74e825ccda477205f73f7d7";
    String title="leon";
    String desc ="what do you think?what do you think?what do you think?what do you think?";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsUtil.hexStringColor("#FCFCFF"),
        title: const SearchInput(),
        elevation: 0,
      ),
      backgroundColor: ColorsUtil.hexStringColor("#FCFCFF"),
      body:SlidableAutoCloseBehavior(
        child:  ListView(
          children: [
            ListItem(imgSrc: src,title: title,desc: desc,slidable: true,),
            ListItem(imgSrc: src,title: title,desc: desc,slidable: true),
            ListItem(imgSrc: src,title: title,desc: desc,slidable: true),
            ListItem(imgSrc: src,title: title,desc: desc,slidable: true),
            ListItem(imgSrc: src,title: title,desc: desc,slidable: true),
            ListItem(imgSrc: src,title: title,desc: desc,slidable: true),
            ListItem(imgSrc: src,title: title,desc: desc,slidable: true),
            ListItem(imgSrc: src,title: title,desc: desc,slidable: true),
            ListItem(imgSrc: src,title: title,desc: desc,slidable: true),
            const SizedBox(height: 10)
          ],
        ),
      )
    );
  }
}
