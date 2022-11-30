import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:misty_chat/entities/user.dart';
import 'package:misty_chat/utils/dio/dio.method.dart';
import 'package:misty_chat/utils/dio/dio.util.dart';
import 'package:misty_chat/utils/dio/dio_response.dart';
import 'package:misty_chat/utils/loading.util.dart';
import 'package:misty_chat/utils/toast.util.dart';

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
      Get.snackbar("请求失败", "${response.data["message"]}");
    }


  }

  Future<bool> sendFriendRequest(String fid, String? senderDesc,String? senderRemark)async{
    const url = "/friend/send_request";
    await LoadingUtil.showLoading();
    DioResponse response = await DioUtil().request(
        url,
        method:DioMethod.post,
        data: {
          "fid":fid,
          "senderDesc":senderDesc,
          "senderRemark":senderRemark
        }
    );
    await  LoadingUtil.closeLoading();
    if(response.code == 0){
      ToastUtil.showToast(content: '发送成功');
      return true;
    }
    if(response.code == 1){
      ToastUtil.showToast(content: "${response.data["message"]}");
    }
    return true;
  }
}