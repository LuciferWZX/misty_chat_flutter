import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:misty_chat/configs/request.config.dart';
import 'package:misty_chat/controllers/app.controller.dart';
import 'package:misty_chat/entities/user.dart';
import 'package:socket_io_client/socket_io_client.dart';
class SocketController extends GetxController{
  late Socket socket ;

  @override
  Future<void> onInit()async {
    await connectAndListen();
    super.onInit();
  }

  Future<void> connectAndListen()async{
    print("connectAndListen----");
    User user = Get.find<AppController>().user.value;
    socket = io(
        RequestConfig.socketURL,
        OptionBuilder()
            .setTransports(["websocket"])
            .setPath("/socket")
            .disableAutoConnect()
            .setExtraHeaders({'foo': 'bar'})
            .setAuth(
            {
              "token":Get.find<AppController>().token.value
            })
            .build()
    );
    socket.onConnect((_){
      debugPrint("socket已连接");
      socket.emit("xxx","ddd");
    });
    socket.onDisconnect((_) {
      debugPrint("socket已断开连接");
    });
    socket.on("message", (data) => debugPrint(data));
    socket.connect();
    socket.emit("name","我是${user.nickname}来自fulutter");
  }
  Future<void> disConnected()async{
    print("disconnect----");
    if(socket.connected){
      socket
          .disconnect()
          .close()
          .destroy();
    }
  }
}