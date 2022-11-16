import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:misty_chat/utils/router.util.dart';
import 'package:misty_chat/utils/store.util.dart';
import 'package:misty_chat/utils/store_key.dart';

class AppController extends GetxController{
  RxString token = "".obs;

  @override
  void onInit(){
    /// 监听token的改变
    ever(token, (newToken){
      debugPrint("新token:$newToken");
      if(newToken == ""){
        StoreUtil.save(StoreKey.token, null);
        RouterUtil.redirectLogin();
      }
    });
    super.onInit();
  }
  void setToken(String newToken){
    token.value = newToken;
  }
}