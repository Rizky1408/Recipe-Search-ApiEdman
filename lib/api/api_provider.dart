import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

enum Method { post, get }

class ApiProvider {
  static Future<Response> callApi(String url, Map<String, dynamic> payload,
      {Method method = Method.get}) async {
    Dio dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: false,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 100));
    Response response;
    if (method == Method.post) {
      response = await dio.post(url, queryParameters: payload);
    } else {
      response = await dio.get(url, queryParameters: payload);
    }
    return response;
  }
}
