import 'package:get_storage/get_storage.dart';
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
  static void save(String storeKey,dynamic value) async{
    GetStorage storage = GetStorage();
    await storage.write(storeKey,value);
  }
  static dynamic get(String storeKey){
    GetStorage storage = GetStorage();
    return storage.read(storeKey);
  }
}