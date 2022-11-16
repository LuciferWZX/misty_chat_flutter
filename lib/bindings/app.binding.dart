import 'package:get/get.dart';
import 'package:misty_chat/controllers/app.controller.dart';

class AppControllerBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<AppController>(() => AppController());
  }
}