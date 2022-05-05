import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mrkt_app/api/auth_interceptor.dart';
import 'package:mrkt_app/local_storage.dart';

class HttpMethod {
  static const String get = "GET";
  static const String post = "POST";
  static const String put = "PUT";
  static const String head = "HEAD";
  static const String delete = "DELETE";
  static const String patch = "PATCH";
}

class DioClient {
  final Dio dio;
  const DioClient(this.dio);

  factory DioClient.instance() {
    return DioClient.getInstance();
  }

  static DioClient getInstance() {
    // create new instance
    final options = BaseOptions(
        baseUrl: 'https://beta.learn.ila.edu.vn/api.php',
        connectTimeout: 5000,
        headers: {'Accept': 'application/json'},
        receiveTimeout: 5000);
    final dio = Dio(options);
    final dioClient = DioClient(dio);

    return dioClient
      ..dio
          .interceptors
          .addAll([LogInterceptor(), AuthInterceptor(dioClient: dioClient)]);
  }

  Future<Map<String, dynamic>> request(
    String method, {
    String? path,
    Map<String, dynamic>? params,
    Map<String, dynamic>? requestData,
  }) async {
    try {
      final response = await dio.request(
        path ?? '',
        options: Options(method: method),
        queryParameters: params,
        data: requestData,
      );
      var data = response.data;
      if (data != null && data is String) {
        final firstCharacter = data[0];
        if (firstCharacter == '{' && data.endsWith('}')) {
          data = jsonDecode(data);
        }
      }

      return {"data": data};
    } catch (e) {
      print('error call');
      print(e);
    }
    return Future.error('no found');
  }

  static getCookieId() async {
    final localCookie = LocalStorage.instance().prefs.getString('cookie');
    if (localCookie != null) return;
    getCoookieFromNetwork();
  }

  static Future<bool> getCoookieFromNetwork() async {
    try {
      final res = await Dio().get('https://beta.learn.ila.edu.vn/');
      final cookie = ((res.headers['set-cookie'])?[0] as String).split(';')[0];

      print('get cookieee');
      return await LocalStorage.instance().prefs.setString('cookie', cookie);
    } catch (e) {
      return false;
    }
  }
}
