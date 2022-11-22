import 'dart:convert';

DioResponse dioResponseFromJson(String str) => DioResponse.fromJson(json.decode(str));
String dioResponseToJson(DioResponse data) => json.encode(data.toJson());
class DioResponse<T> {

  /// 消息(例如成功消息文字/错误消息文字)
  final String? message;
  /// 自定义code(可根据内部定义方式)
  final int? code;
  /// 接口返回的数据
  final T? data;
  /// 需要添加更多
  /// .........
  DioResponse({
    this.message,
    this.data,
    this.code,
  });

  @override
  String toString() {
    StringBuffer sb = StringBuffer('{');
    sb.write("\"message\":\"$message\"");
    sb.write(",\"code\":$code");
    sb.write(",\"data\":\"$data\"");
    sb.write('}');
    return sb.toString();
  }
  factory DioResponse.fromJson(Map<String, dynamic> json) => DioResponse(
    message: json["message"],
    code: json["code"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "code": code,
    "data": data,
  };
}

class DioResponseCode {
  /// 成功
  static const int success = 0;
  /// 错误
  static const int error = 1;
/// 更多
}