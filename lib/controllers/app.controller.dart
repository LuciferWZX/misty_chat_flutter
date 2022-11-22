import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:misty_chat/routes/index.dart';
import 'package:misty_chat/utils/alert.util.dart';
import 'package:misty_chat/utils/dio/dio.method.dart';
import 'package:misty_chat/utils/dio/dio.util.dart';
import 'package:misty_chat/utils/dio/dio_response.dart';
import 'package:misty_chat/utils/loading.util.dart';
import 'package:misty_chat/utils/router.util.dart';
import 'package:misty_chat/utils/store.util.dart';
import 'package:misty_chat/utils/store_key.dart';

class AppController extends GetxController{
  RxString token = "".obs;

  @override
  void onInit(){
    /// 监听token的改变
    ever(token, (newToken){
      debugPrint("新token:$newToken");
      if(newToken == ""){
        StoreUtil.save(StoreKey.token, null);
        LoadingUtil.closeLoading();
        RouterUtil.redirectPath(path:RoutePath.login);

      }
    });
    super.onInit();
  }
  void setToken(String newToken){
    token.value = newToken;
  }

  Future<void> loginByPhone({
    required String phone,
    required String pin
  })async{
    const url = "/user/login_with_phone";
    // DioUtil.getInstance()?.openLog();
    await LoadingUtil.showLoading(title: "登录中...");
    DioResponse response = await DioUtil().request(
      url,
      method:DioMethod.post,
      data: {
        "phone":phone,
        "pin":pin
      }
    );
    await  LoadingUtil.closeLoading();
    if(response.code == 0){
      AlertUtil.showSuccessAlert(title: "登录成功",content:"欢迎使用");
      await StoreUtil.save(StoreKey.token,response.data["data"]["token"]);
      await RouterUtil.redirectPath(path: RoutePath.home);
    }
    if(response.code == 1){
      AlertUtil.showErrorAlert(title: "登录失败",content: response.data["message"]);
    }
    print("请求结果：$response");
  }
}