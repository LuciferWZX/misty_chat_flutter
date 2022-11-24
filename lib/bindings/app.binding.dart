import 'package:get/get.dart';
import 'package:misty_chat/controllers/app.controller.dart';
import 'package:misty_chat/controllers/socket.controller.dart';

class UserControllerBinding extends Bindings{
  @override
  void dependencies(){
    // Get.lazyPut<AppController>(() => AppController());
    Get.put<SocketController>(SocketController());
  }
}