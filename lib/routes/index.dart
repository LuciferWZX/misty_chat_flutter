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
        page: ()=>const HomePage(),
        middlewares: [
          RouterAuthMiddleware(priority: 0)
        ]
    ),
    GetPage(name: Path.message, page: ()=>const MessagePage()),
    GetPage(name: Path.addressBook, page: ()=>const AddressBookPage()),
    GetPage(name: Path.find, page: ()=>const FindPage()),
    GetPage(name: Path.me, page: ()=>const MePage()),
    GetPage(name: Path.login, page: ()=>const LoginPage())
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