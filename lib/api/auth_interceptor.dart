import 'package:dio/dio.dart';
import 'package:mrkt_app/api/dio_client.dart';
import 'package:mrkt_app/local_storage.dart';

class AuthInterceptor extends Interceptor {
  final DioClient dioClient;

  AuthInterceptor({
    required this.dioClient,
  });

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final cookieStr =
        LocalStorage.instance().prefs.getString(LocalStorage.cookie);
    // add cookie to the request header
    print(cookieStr);
    if (cookieStr != null) {
      options.headers.addAll({"cookie": cookieStr});
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
    dioClient.dio.lock();
    await DioClient.getCoookieFromNetwork();
    dioClient.dio.unlock();
    final newDioInstance = dioClient.dio;
    return await newDioInstance.request(
      requestOptions.path,
      data: requestOptions.data,
      options: Options(method: requestOptions.method),
      queryParameters: requestOptions.queryParameters,
    );
  }
}
