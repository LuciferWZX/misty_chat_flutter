import 'package:get/get.dart';

class RouterUtil {
  static Future<void> redirectPath({required String path})async{
    return await Get.offAllNamed(path);
  }
}