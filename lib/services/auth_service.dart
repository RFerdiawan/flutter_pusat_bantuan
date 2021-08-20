import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_starter_provider/services/service.dart';

class AuthService extends Service{
  Future<Response> postLogin(var data) async {
    try {
      var url = '/login';
      print(url);

      var response = await postLogin2(url, data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        return response;
      } else {
        print(response.statusCode);

        throw ('data tidak ditemukan');
      }
    } on SocketException catch (_) {
      print('asd');

      throw SocketException('no_internet');
    } catch (error) {
      if (error is DioError) {
        print(error.response.statusCode);
        throw (error.response.statusCode);
      }
    }
  }
}