import 'package:get/get.dart';
import 'package:misty_chat/bindings/app.binding.dart';
import 'package:misty_chat/bindings/contact.binding.dart';
import 'package:misty_chat/bindings/user.binding.dart';
import 'package:misty_chat/middleware/router_auth.middleware.dart';
import 'package:misty_chat/pages/address_book/friend_detail/index.dart';
import 'package:misty_chat/pages/address_book/index.dart';
import 'package:misty_chat/pages/address_book/new_friend/index.dart';
import 'package:misty_chat/pages/address_book/request_friend/index.dart';
import 'package:misty_chat/pages/address_book/search_user/index.dart';
import 'package:misty_chat/pages/address_book/user_detail/index.dart';
import 'package:misty_chat/pages/find/index.dart';
import 'package:misty_chat/pages/home/index.dart';
import 'package:misty_chat/pages/login/index.dart';
import 'package:misty_chat/pages/me/index.dart';
import 'package:misty_chat/pages/message/index.dart';

class Routes {
  static const String initialRoute = RoutePath.home;
  static List<GetPage> pages = [
    GetPage(
        name: RoutePath.home,
        page: ()=>const HomePage(),
        bindings:[
          AppControllerBinding(),
          UserControllerBinding(),
          ContactControllerBinding()
        ],
        middlewares: [
          RouterAuthMiddleware(priority: 0)
        ]
    ),
    GetPage(name: RoutePath.message, page: ()=>const MessagePage()),
    GetPage(
        name: RoutePath.addressBook,
        page: ()=>const AddressBookPage()
    ),
    GetPage(name: RoutePath.searchUser, page: ()=>SearchUserPage()),
    GetPage(name: RoutePath.find, page: ()=>const FindPage()),
    GetPage(name: RoutePath.me, page: ()=>MePage()),
    GetPage(name: RoutePath.login, page: ()=>const LoginPage()),
    GetPage(name: RoutePath.userDetail, page: ()=>UserDetailPage()),
    GetPage(name: RoutePath.friendDetail, page: ()=>FriendDetailPage()),
    GetPage(name: RoutePath.requestFriend, page: ()=>RequestFriendPage()),
    GetPage(name: RoutePath.newFriend, page: ()=>NewFriendPage())
  ];
}
class RoutePath {
  static const String home = "/home";//首页
  static const String message = "/message";//消息
  static const String addressBook = "/address_book";//通讯录
  static const String newFriend = "/address_book/new_friend";//新朋友列表
  static const String searchUser = "/address_book/search_user";//查找用户搜索页
  static const String requestFriend = "/address_book/request_friend";//好友申请页面
  static const String userDetail = "/user_detail";//用户详情
  static const String friendDetail = "/friend_detail";//用户详情
  static const String find = "/find";//发现
  static const String me = "/me";//我
  static const String login = "/login";//登录
}