import 'package:get/get.dart';
import 'package:misty_chat/controllers/app.controller.dart';
import 'package:misty_chat/controllers/socket.controller.dart';

class AppControllerBinding extends Bindings{
  @override
  void dependencies(){
    // Get.lazyPut<AppController>(() => AppController());
    Get.put<AppController>(AppController());
  }
}