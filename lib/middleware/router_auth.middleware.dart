import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:misty_chat/routes/index.dart';
import 'package:misty_chat/utils/store_key.dart';

class RouterAuthMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  RouterAuthMiddleware({required this.priority}); //重定向，当正在搜索被调用路由的页面时，将调用该函数
  @override
  RouteSettings? redirect(String? route) {
    print("开始鉴权...");
    GetStorage storage = GetStorage();
    String? token = storage.read(StoreKey.token);
    print("当前用户token:${token}");
    print("鉴权结束...");
    if(token==null){
      Future.delayed(const Duration(seconds: 2), () => Get.snackbar("提示", "请先登录APP"));
      return const RouteSettings(name: Path.login);
    }

  }
}