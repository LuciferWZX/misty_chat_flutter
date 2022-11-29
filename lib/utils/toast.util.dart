import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:misty_chat/utils/global.util.dart';


class ToastUtil {
  static void showToast({
    required String content
  }){

    BuildContext? context = Global.navigatorKey.currentState!.context;
    context.showToast(
        content,duration: const Duration(seconds: 2)
    );
  }
  static void showErrorToast({
    required String text,
  }){
    BuildContext? context = Global.navigatorKey.currentState!.context;
    context.showErrorBar(
        content: Text(text));

  }
}