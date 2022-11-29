import 'package:get/get.dart';
import 'package:misty_chat/controllers/app.controller.dart';
import 'package:misty_chat/controllers/socket.controller.dart';
import 'package:misty_chat/controllers/user.controller.dart';

class UserControllerBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut<UserController>(() => UserController());
    Get.put<SocketController>(SocketController());
  }
}