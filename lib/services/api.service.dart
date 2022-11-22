import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misty_chat/controllers/app.controller.dart';

class APIService extends GetxService{
  @override
  void onInit(){
    debugPrint('APIService< onInit >');
    super.onInit();
  }
  @override
  void onReady() {
    debugPrint('APIService< onReady >');
    super.onReady();
  }
  @override
  void onClose() {
    debugPrint('APIService< onClose >');
    super.onClose();
  }
  Future<APIService> init()async{
    return this;
  }
  Future<AppController> getAppController()async{
    return Get.find<AppController>();
  }
}