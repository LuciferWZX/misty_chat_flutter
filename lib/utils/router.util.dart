import 'package:get/get.dart';

class RouterUtil {
  static Future<void> redirectPath({required String path})async{
    return await Get.offAllNamed(path);
  }
  ///A->B->C->D  想让D->B
  ///退回到指定页面
  static Future<void> goBackPath({required String path})async{
    return await Get.offNamedUntil(path, (route) =>  (route as GetPageRoute).routeName == null);
  }
}