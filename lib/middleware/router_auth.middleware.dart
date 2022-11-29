import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misty_chat/controllers/app.controller.dart';
import 'package:misty_chat/entities/user.dart';
import 'package:misty_chat/routes/index.dart';
import 'package:misty_chat/utils/store.util.dart';
import 'package:misty_chat/utils/store_key.dart';

class RouterAuthMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  RouterAuthMiddleware({required this.priority}); //重定向，当正在搜索被调用路由的页面时，将调用该函数
  @override
  RouteSettings? redirect(String? route) {
    debugPrint("开始鉴权...");
    String? token = StoreUtil.get(StoreKey.token);
    String? currentUserId = StoreUtil.get(StoreKey.currentUserId);
    Map<String,dynamic> users = StoreUtil.get(StoreKey.users) ?? {};
    debugPrint("鉴权结束...");
    if(token!=null){
      ///将token保存到state中
      Get.find<AppController>().setToken(token);

      dynamic currentUser = users[currentUserId];
      if(currentUser!=null){
        //将当前的用户存入state中
        Get.find<AppController>().setUser(User.fromJson(currentUser));
      }
      return null;
    }
    Future.delayed(const Duration(seconds: 0), () => Get.snackbar("提示", "请先登录APP"));
    return const RouteSettings(name: RoutePath.login);
  }
}