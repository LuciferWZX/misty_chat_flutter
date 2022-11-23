import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:misty_chat/entities/user.dart';
import 'package:misty_chat/utils/store_key.dart';
class StoreUtil {
  static late StoreUtil _instance;
  factory StoreUtil()=>_getInstance();
  // 私有构造函数
  StoreUtil._internal() {

    // 初始化
  }
  static StoreUtil _getInstance(){
    _instance;
    return _instance;
  }
  static Future<void> save(String storeKey,dynamic value) async{
    GetStorage storage = GetStorage();
    await storage.write(storeKey,value);
  }
  static dynamic get(String storeKey){
    GetStorage storage = GetStorage();
    return storage.read(storeKey);
  }
  //更新
  static Future<void> updateUser(User newUser,) async{
    GetStorage storage = GetStorage();
    Map<String,dynamic> userMap =storage.read(StoreKey.users)??{};
    debugPrint("userMap:${userMap.toString()}");
    userMap[newUser.id!] = newUser.toJson();
    await storage.write(StoreKey.users,userMap);
  }
}