import 'package:dio/dio.dart';
import 'config.dart';

class HttpRequest {
  // 1.创建DIO实例
  static BaseOptions baseOptions = BaseOptions(
    baseUrl: BASE_URL,
    connectTimeout: TIME_OUT,
  );
  static final dio = Dio(baseOptions);
  // 2.封装方法
  static Future request(String url,
      {String method = "get", Map<String, dynamic> params}) async {
    // 3.发送网络请求
    Options options = Options(method: method);
    try {
      final result =
          await dio.request(url, queryParameters: params, options: options);
      return result;
    } on DioError catch (err) {
      throw err;
    }
  }
}
