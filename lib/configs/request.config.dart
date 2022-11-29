class RequestConfig {
  /// 连接超时时间
  static const int connectTimeout = 6*1000;
  /// 响应超时时间
  static const int receiveTimeout = 6*1000;
  /// 请求的URL前缀
  // static const String baseURL = "http://192.168.163.140:3000/api";
  // static const String baseIP = "10.86.8.243";
  static const String baseIP = "192.168.163.140";
  static const String baseURL = "http://$baseIP:3000/api";
  // static const String socketURL = "ws://192.168.163.140:3000/";
  static const String socketURL = "ws://$baseIP:3000/";
  /// 是否开启网络缓存,默认false
  static const bool cacheEnable = false;
  /// 最大缓存时间(按秒), 默认缓存七天,可自行调节
  static const int maxCacheAge = 7*24*60*60;
  /// 最大缓存条数(默认一百条)
  static int maxCountCache = 100;
}