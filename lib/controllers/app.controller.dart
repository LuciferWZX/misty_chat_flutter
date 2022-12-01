import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:misty_chat/controllers/socket.controller.dart';
import 'package:misty_chat/entities/friend_request.dart';
import 'package:misty_chat/entities/user.dart';
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
  RxString token = "".obs;///当前用户的token
  Rx<User> user = User().obs;///当前的登录用户
  RxInt homeIndex = 0.obs;

  @override
  void onInit(){
    /// 监听token的改变
    ever(token, (newToken){
      if(newToken == ""){
        Get.find<SocketController>().disConnected();
        StoreUtil.save(StoreKey.token, null);
        StoreUtil.save(StoreKey.currentUserId, null);
        LoadingUtil.closeLoading();
        RouterUtil.redirectPath(path:RoutePath.login);
      }else{
        StoreUtil.save(StoreKey.token, newToken);
      }
    });
    ever(user, (User newUser)async{
      await StoreUtil.save(StoreKey.currentUserId, newUser.id);
    });
    super.onInit();
  }
  void setToken(String newToken){
    token.value = newToken;
  }
  void setUser(User? newUser){
    user.value = newUser!;
  }
  setHomeIndex(int index){
    homeIndex.value = index;
  }
  logout(){
    setToken("");
    homeIndex.value = 0;
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
      User user = User.fromJson(response.data["data"]);
      setToken(user.token??"");
      setUser(user);
      //登录成功，保存该用户信息到内存
      await StoreUtil.updateUser(user);
      await RouterUtil.redirectPath(path: RoutePath.home);
    }
    if(response.code == 1){
      print("res:$response");
      AlertUtil.showErrorToast(text: response.data["message"] );
    }
    print("请求结果：$response");
  }

  ///检查token是否可用
  Future<bool> checkToken()async{
    const url = "/user/check_token";
    DioResponse response = await DioUtil().request(
        url,
        method:DioMethod.get,
    );
    if(response.code == 0){
      return true;
    }
    return false;
  }
}