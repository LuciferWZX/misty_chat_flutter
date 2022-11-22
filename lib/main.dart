import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:misty_chat/pages/app.dart';
import 'package:misty_chat/services/api.service.dart';

void main() async{
  await initServices();
  await GetStorage.init();
  runApp(const KeyboardDismissOnTap(child: MyApp()));
}
///初始化service
Future<void> initServices() async {
  debugPrint('启动service ...');
  await Get.putAsync(() => APIService().init());//API
  debugPrint('所有的service已启动 ...');
}
