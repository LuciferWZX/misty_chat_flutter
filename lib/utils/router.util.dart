import 'package:get/get.dart';
import 'package:misty_chat/routes/index.dart';

class RouterUtil {
  static void redirectLogin(){
    Get.offAllNamed(Path.login);
  }
}