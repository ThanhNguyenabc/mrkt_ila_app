import 'dart:convert';

import 'package:data/data.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import 'auth_interceptor.dart';

const unknownCode = 1000;
const baseURL = 'https://beta.learn.ila.edu.vn';

class HttpMethod {
  static const String get = "GET";
  static const String post = "POST";
  static const String put = "PUT";
  static const String head = "HEAD";
  static const String delete = "DELETE";
  static const String patch = "PATCH";
}

class AppDio with DioMixin {
  final AuthLocalData authLocalData;

  AppDio._({required this.authLocalData}) {
    final options = BaseOptions(
        baseUrl: '$baseURL/api.php',
        connectTimeout: 5000,
        headers: {'Accept': 'application/json'},
        receiveTimeout: 5000);

    this.options = options;

    interceptors.add(AuthInterceptor(dioClient: this));
    httpClientAdapter = DefaultHttpClientAdapter();
  }

  factory AppDio.getInstance(AuthLocalData authLocalData) =>
      AppDio._(authLocalData: authLocalData);

  Future<Map<String, dynamic>> getData(
    String functionName, {
    String? path,
    Map<String, dynamic>? params,
  }) =>
      fetchData(HttpMethod.get, functionName, path: path, params: params);

  Future<Map<String, dynamic>> postData(
    String functionName, {
    String? path,
    Map<String, dynamic>? params,
    Map<String, dynamic>? requestData,
  }) =>
      fetchData(HttpMethod.post, functionName,
          path: path, params: params, requestData: requestData);

  Future<Map<String, dynamic>> fetchData(
    String method,
    String functionName, {
    String? path,
    Map<String, dynamic>? params,
    Map<String, dynamic>? requestData,
  }) async {
    final arg = <String, dynamic>{"f": functionName};
    if (params != null) {
      arg.addAll(params);
    }
    try {
      final response = await request(
        path ?? '',
        options: Options(method: method),
        queryParameters: arg,
        data: requestData,
      );

      final statusCode = response.statusCode;
      if (statusCode != 200) return {"errorMsg": "", "code": statusCode};
      var data = response.data;

      if (data != null && data is String) {
        final firstCharacter = data[0];
        if (firstCharacter == '{' && data.endsWith('}')) {
          data = jsonDecode(data);
        }
      }
      return {"data": data, "code": statusCode};
    } catch (e) {
      print('error dio call $e');
      return {"errorMsg": "unknown", "code": unknownCode};
    }
  }

  Future<Result<String>> getCookieId() async {
    final res = await authLocalData.getCookieId();
    if (res.data != null) Result.completed(res.data);
    return getCoookieFromNetwork();
  }

  Future<Result<String>> getCoookieFromNetwork() async {
    try {
      final res = await Dio().get(baseURL);
      final cookie = ((res.headers['set-cookie'])?[0] as String).split(';')[0];
      // save to local
      authLocalData.saveCookieId(cookie);
      return Result.completed(cookie);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
