// To parse this JSON data, do
//
//     final contact = contactFromJson(jsonString);

import 'dart:convert';

ContactUser contactFromJson(String str) => ContactUser.fromJson(json.decode(str));

String contactToJson(ContactUser data) => json.encode(data.toJson());

class ContactUser {
  ContactUser({
    required this.id,
    required this.email,
    required this.avatar,
    required this.phone,
    required this.nickname,
    required this.username,
    required this.authority,
    required this.sex,
    required this.banned,
  });

  String id;
  String email;
  String avatar;
  String phone;
  String nickname;
  String username;
  int authority;
  int sex;
  bool banned;

  factory ContactUser.fromJson(Map<String, dynamic> json) => ContactUser(
    id: json["id"],
    email: json["email"],
    phone: json["phone"],
    nickname: json["nickname"],
    username: json["username"],
    authority: json["authority"],
    sex: json["sex"],
    banned: json["banned"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "phone": phone,
    "nickname": nickname,
    "username": username,
    "authority": authority,
    "sex": sex,
    "banned": banned,
    "avatar": avatar,
  };
}
