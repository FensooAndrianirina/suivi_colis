import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    print("Request Path: \${options.path}");
    print("Request Data: \${options.data}");
  }
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    print("Response Status Code: \${response.statusCode}");
    print("Response Data: \${response.data}");
  }
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    print("Error: \${err.error}");
  }
}
