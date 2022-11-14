import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
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
  var currentIndex = 0;
  List<Widget> pages = [
    MessagePage(),
    AddressBookPage(),
    FindPage(),
    MePage()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: pages[currentIndex],
          bottomNavigationBar: ConvexAppBar(
            style: TabStyle.flip,
            items: [
              TabItem(icon: Icons.message, title: '消息'),
              TabItem(icon: Icons.people, title: '通讯录'),
              TabItem(icon: Icons.compass_calibration_outlined, title: '发现'),
              TabItem(icon: Icons.message, title: '我'),
            ],
            onTap: (int i){
              if(i!= currentIndex){
                setState(() {
                  currentIndex = i;
                });
              }

            },
          ),
        )
    );
  }
}
