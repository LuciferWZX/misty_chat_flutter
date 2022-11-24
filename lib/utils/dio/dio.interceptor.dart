import 'package:dio/dio.dart';
import 'package:misty_chat/utils/alert.util.dart';
import 'package:misty_chat/utils/device.util.dart';
import 'package:misty_chat/utils/loading.util.dart';

import 'dio_response.dart';

class DioInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 对非open的接口的请求参数全部增加userId
    // if (!options.path.contains("open")) {
    //   options.queryParameters["userId"] = "xxx";
    // }

    // 头部添加token
    // options.headers["token"] = "xxx";
    String device =DeviceUtil.getDevicePlatform();
    options.headers["user-agent"] = device;

    // 更多业务需求

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    // 请求成功是对数据做基本处理
    if (response.statusCode == 200) {
      response.data = DioResponse(code: 0, message: "请求成功啦", data: response.data);
    } else {
      response.data = DioResponse(code: 1, message: "请求失败啦", data: response.data);
    }

    // 对某些单独的url返回数据做特殊处理
    if (response.requestOptions.baseUrl.contains("???????")) {
      //....
    }

    // 根据公司的业务需求进行定制化处理

    // 重点
    handler.next(response);
  }

  @override
  Future<dynamic> onError(DioError err, ErrorInterceptorHandler handler)async {
    print("xxxxaaa:${err.error}");
    // if(err.response == null){
    //   Response res =  Response(requestOptions: err.requestOptions);
    //   res.data = DioResponse(code: 1, message: "请求失败啦", data: response.data)
    //   handler.resolve(response);
    // }
    switch(err.type) {
    // 连接服务器超时
      case DioErrorType.connectTimeout:
        {
          // 根据自己的业务需求来设定该如何操作,可以是弹出框提示/或者做一些路由跳转处理
          await  LoadingUtil.closeLoading();
          AlertUtil.showErrorAlert(title: "连接超时",content: "连接服务器出现问题。");
        }
        break;
    // 响应超时
      case DioErrorType.receiveTimeout:
        {
          // 根据自己的业务需求来设定该如何操作,可以是弹出框提示/或者做一些路由跳转处理
          await  LoadingUtil.closeLoading();
        }
        break;
    // 发送超时
      case DioErrorType.sendTimeout:
        {
          // 根据自己的业务需求来设定该如何操作,可以是弹出框提示/或者做一些路由跳转处理
          await  LoadingUtil.closeLoading();
        }
        break;
    // 请求取消
      case DioErrorType.cancel:
        {
          // 根据自己的业务需求来设定该如何操作,可以是弹出框提示/或者做一些路由跳转处理
          await  LoadingUtil.closeLoading();
        }
        break;
    // 404/503错误
      case DioErrorType.response:
        {
          final response = err.response;
          if(response != null){
            response.data = DioResponse(code: 1, message: "请求失败啦", data: response.data);
            handler.resolve(response);
          }

          // 根据自己的业务需求来设定该如何操作,可以是弹出框提示/或者做一些路由跳转处理
        }
        break;
    // other 其他错误类型
      case DioErrorType.other:
        {
          print("xxxx:$err");
          if(err.response == null){
            await  LoadingUtil.closeLoading();
            AlertUtil.showErrorAlert(title: "出错了",content: "连接服务器出现问题。");
          }
        }
        break;

    }
    // super.onError(err, handler);
  }
}