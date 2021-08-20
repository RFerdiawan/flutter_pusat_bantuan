import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_starter_provider/configs/locator.dart';
import 'package:flutter_starter_provider/services/api_interceptors.dart';


class Service {
  String url = '';
  Dio dio = locator<ApiInterceptors>().dio;

  String baseUrl = 'http://192.168.48.229:8000/bantuan_API/public/api';

  Future getWithCache(String url,
      {Duration duration,
        String key,
        String subKey,
        bool isRefresh = false}) async {
    url = baseUrl + url;
    print(url);
      final response = dio.get(url,
          options: buildCacheOptions(duration,
              primaryKey: key,
              subKey: subKey,
              maxStale: Duration(minutes: 2),
              forceRefresh: isRefresh,
              options: Options(headers: {'requiresToken': true})));
      return response;
  }

  Future get(String url) async {
    try {
      url = baseUrl + url;
      print(url);
        final response = dio.get(url);
        return response;
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        print('timeout');
      }
      if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
        print('timeout2');
      }
    }
  }

  Future postLogin2(String url, var data) async {
    url = baseUrl + url;
    print(url);
      print(data);
      final Response response = await dio.post(url,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          }),
          data: data);
      print(response);
      return response;

  }

  Future post(String url, var data) async {
    url = baseUrl + url;
    print(url);
      final response = await dio.post(url,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          }),
          data: data);
      return response;
  }

  Future put(String url, var data) async {
    url = baseUrl + url;
    print(url);
      final response = await dio.put(url,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          }),
          data: data);
      return response;
  }

  Future patch(String url, var data) async {
    url = baseUrl + url;
    print(url);
      final response = await dio.patch(url,
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'requiresToken': true
          }),
          data: data);
      return response;
  }
}