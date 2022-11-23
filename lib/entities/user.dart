// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.email,
    this.avatar,
    this.phone,
    this.nickname,
    this.username,
    this.createdDate,
    this.updatedDate,
    this.authority,
    this.sex,
    this.banned,
    this.device,
    this.token,
  });

  String? id;
  String? email;
  String? phone;
  String? nickname;
  String? username;
  String? avatar;
  String? createdDate;
  String? updatedDate;
  int? authority;
  int? sex;
  bool? banned;
  int? device;
  String? token;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    avatar: json["avatar"],
    phone: json["phone"],
    nickname: json["nickname"] ,
    username: json["username"],
    createdDate: json["createdDate"],
    updatedDate: json["updatedDate"],
    authority: json["authority"],
    sex: json["sex"],
    banned: json["banned"],
    device: json["device"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "phone": phone,
    "avatar": avatar,
    "nickname": nickname,
    "username": username,
    "createdDate": createdDate,
    "updatedDate": updatedDate,
    "authority": authority,
    "sex": sex,
    "banned": banned,
    "device": device,
    "token": token,
  };
}
