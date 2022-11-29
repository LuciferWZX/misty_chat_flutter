import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:misty_chat/entities/user.dart';
import 'package:misty_chat/utils/dio/dio.method.dart';
import 'package:misty_chat/utils/dio/dio.util.dart';
import 'package:misty_chat/utils/dio/dio_response.dart';
import 'package:misty_chat/utils/loading.util.dart';

class UserController extends GetxController {
  Rx<User> user = User().obs;

  Future<void> getUserDetails(String userId)async {
    const url = "/user/get_user_details";
    await LoadingUtil.showLoading();
    DioResponse response = await DioUtil().request(
        url,
        method:DioMethod.post,
        data: {
          "uid":userId,
        }
    );
    await  LoadingUtil.closeLoading();
    if(response.code == 0){
      User userDetail = User.fromJson(response.data["data"]);
      user.value = userDetail;
    }
    if(response.code == 1){
      print("res:$response");
      Get.snackbar("请求失败", "${response.data["message"]}");
          // .showErrorAlert(title: "登录失败",content: response.data["message"]);
    }


  }
}