import 'package:flutter/material.dart';
import 'package:misty_chat/utils/color.util.dart';

class MePage extends StatefulWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: ColorsUtil.hexStringColor("#ecf0f1"),
      body: Center(
        child: Text("me",style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
