import 'package:get/get.dart';
import 'package:misty_chat/middleware/router_auth.middleware.dart';
import 'package:misty_chat/pages/address_book/index.dart';
import 'package:misty_chat/pages/find/index.dart';
import 'package:misty_chat/pages/home/index.dart';
import 'package:misty_chat/pages/login/index.dart';
import 'package:misty_chat/pages/me/index.dart';
import 'package:misty_chat/pages/message/index.dart';

class Routes {
  static const String initialRoute = Path.home;
  static List<GetPage> pages = [
    GetPage(
        name: Path.home,
        page: ()=>HomePage(),
        middlewares: [
          RouterAuthMiddleware(priority: 0)
        ]
    ),
    GetPage(name: Path.message, page: ()=>MessagePage()),
    GetPage(name: Path.addressBook, page: ()=>AddressBookPage()),
    GetPage(name: Path.find, page: ()=>FindPage()),
    GetPage(name: Path.me, page: ()=>MePage()),
    GetPage(name: Path.login, page: ()=>LoginPage())
  ];
}
class Path {
  static const String home = "/home";//消息
  static const String message = "/message";//消息
  static const String addressBook = "/address_book";//首页
  static const String find = "/find";//发现
  static const String me = "/me";//我
  static const String login = "/login";//登录
}