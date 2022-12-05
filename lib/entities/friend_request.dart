// To parse this JSON data, do
//
//     final friendRequest = friendRequestFromJson(jsonString);

import 'dart:convert';

FriendRequest friendRequestFromJson(String str) => FriendRequest.fromJson(json.decode(str));

String friendRequestToJson(FriendRequest data) => json.encode(data.toJson());

class FriendRequest {
  FriendRequest({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.createdDate,
    required this.updatedDate,
    this.senderDesc,
    this.senderRemark,
    this.denialReason,
    required this.responseStatus,
    required this.deleteStatus,
    this.friendInfo,
  });

  String id;
  String senderId;
  String receiverId;
  String createdDate;
  String updatedDate;
  String? senderDesc;
  String? senderRemark;
  String? denialReason;
  FriendInfo? friendInfo;
  int responseStatus;
  int deleteStatus;

  factory FriendRequest.fromJson(Map<String, dynamic> json) => FriendRequest(
    id: json["id"],
    senderId: json["senderId"],
    receiverId: json["receiverId"],
    createdDate: json["createdDate"],
    updatedDate: json["updatedDate"],
    senderDesc: json["senderDesc"],
    senderRemark: json["senderRemark"],
    denialReason: json["denialReason"],
    responseStatus: json["responseStatus"],
    deleteStatus: json["deleteStatus"],
    friendInfo: FriendInfo.fromJson(json["friendInfo"])
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "senderId": senderId,
    "receiverId": receiverId,
    "createdDate": createdDate,
    "updatedDate": updatedDate,
    "senderDesc": senderDesc,
    "senderRemark": senderRemark,
    "denialReason": denialReason,
    "responseStatus": responseStatus,
    "deleteStatus": deleteStatus,
    "friendInfo": friendInfo?.toJson(),
  };
}
class FriendInfo {
  FriendInfo({
    required this.id,
    required this.nickname,
    required this.username,
    required this.avatar,
  });

  String id;
  String nickname;
  String username;
  String avatar;

  factory FriendInfo.fromJson(Map<String, dynamic> json) => FriendInfo(
    id: json["id"],
    nickname: json["nickname"],
    username: json["username"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nickname": nickname,
    "username": username,
    "avatar": avatar,
  };
}