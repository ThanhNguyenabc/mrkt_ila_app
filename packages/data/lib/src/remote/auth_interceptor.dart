import 'package:data/data.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final AppDio dioClient;
  AuthInterceptor({required this.dioClient});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final cookieId = await dioClient.getCookieId();
    // add cookie to the request header
    print("abcccc");
    print(cookieId.data);
    if (cookieId.data != null) {
      options.headers.addAll({"cookie": cookieId.data});
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 500) {
      final res = await handleSessonExpire(err.requestOptions);
      handler.resolve(res);
      return;
    } else {
      super.onError(err, handler);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final statusCode = response.statusCode;
    if (statusCode == 500) {
      final res = await handleSessonExpire(response.requestOptions);
      handler.resolve(res);
      return;
    }
    super.onResponse(response, handler);
  }

  Future<Response<dynamic>> handleSessonExpire(
      RequestOptions requestOptions) async {
    dioClient.lock();
    await dioClient.getCoookieFromNetwork();
    dioClient.unlock();
    return await dioClient.request(
      requestOptions.path,
      data: requestOptions.data,
      options: Options(method: requestOptions.method),
      queryParameters: requestOptions.queryParameters,
    );
  }
}
