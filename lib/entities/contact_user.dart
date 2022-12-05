// To parse this JSON data, do
//
//     final contact = contactFromJson(jsonString);

import 'dart:convert';

ContactUser contactFromJson(String str) => ContactUser.fromJson(json.decode(str));

String contactToJson(ContactUser data) => json.encode(data.toJson());

class ContactUser {
  ContactUser({
    this.id,
    this.email,
    this.avatar,
    this.phone,
    this.nickname,
    this.remark,
    this.username,
    this.authority,
    this.sex,
    this.banned,
  });

  String? id;
  String? email;
  String? avatar;
  String? phone;
  String? nickname;
  String? remark;
  String? username;
  int? authority;
  int? sex;
  bool? banned;

  factory ContactUser.fromJson(Map<String, dynamic> json) => ContactUser(
    id: json["id"],
    email: json["email"],
    phone: json["phone"],
    nickname: json["nickname"],
    remark: json["remark"],
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
    "remark": remark,
    "nickname": nickname,
    "username": username,
    "authority": authority,
    "sex": sex,
    "banned": banned,
    "avatar": avatar,
  };
}
