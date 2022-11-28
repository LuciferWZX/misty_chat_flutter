import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:misty_chat/entities/user.dart';
import 'package:misty_chat/utils/dio/dio.method.dart';
import 'package:misty_chat/utils/dio/dio.util.dart';
import 'package:misty_chat/utils/dio/dio_response.dart';

class ContactController extends GetxController{
  ///用户搜索的
  RxList<User> userList = RxList<User>.empty();
  ///用户搜索的关键字
  RxString query = "".obs;
  TextEditingController textController = TextEditingController();
  @override
  void onInit() {
    textController.addListener(() {
      query.value = textController.text;
    });
    // TODO: 停止输入1秒后开始查询
    debounce(query, (newQuery){
      if(newQuery!=""){
        searchUsers(query:newQuery);
      }
      debugPrint("newQuery:$newQuery");
    });
    super.onInit();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    textController.dispose();
    super.dispose();
  }


  Future<void> searchUsers({String? query})async {
    const url = "/friend/search_users";
    // DioUtil.getInstance()?.openLog();
    DioResponse response = await DioUtil().request(
        url,
        method:DioMethod.post,
        data: {
          "query":query
        }
    );
    if(response.code == 0){
      List<dynamic> res = response.data['data'];
      userList.value = res.map((e) => User.fromJson(e)).toList();
    }
  }
}