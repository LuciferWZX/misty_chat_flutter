import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misty_chat/controllers/app.controller.dart';
import 'package:misty_chat/pages/address_book/index.dart';
import 'package:misty_chat/pages/find/index.dart';
import 'package:misty_chat/pages/me/index.dart';
import 'package:misty_chat/pages/message/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppController appController = Get.find<AppController>();
  List<Widget> pages = [
    const MessagePage(),
    const AddressBookPage(),
    const FindPage(),
    const MePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[appController.homeIndex.value],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.flip,
        items: const [
          TabItem(icon: Icons.message, title: '消息'),
          TabItem(icon: Icons.people, title: '通讯录'),
          TabItem(icon: Icons.compass_calibration_outlined, title: '发现'),
          TabItem(icon: Icons.message, title: '我'),
        ],
        onTap: (int i){
          if(i!= appController.homeIndex.value){
            setState(() {
              appController.homeIndex.value = i;
            });
          }
        },
      ),
    );
  }
}
