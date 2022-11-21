import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingUtil {
  static Future<void> showLoading({
    String? title,
    bool? dismissOnTap = false
  })async{
    await EasyLoading.show(
      status: title,
      dismissOnTap: dismissOnTap,
      maskType: EasyLoadingMaskType.black,
    );
  }
  static Future<void> closeLoading()async{
    await EasyLoading.dismiss();
  }
}