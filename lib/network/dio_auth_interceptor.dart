import 'package:dio/dio.dart';

class DioAuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.headers['Authorization'] = 'Bearer TOKEN_EXAMPLE';

    super.onRequest(options, handler);
  }
}