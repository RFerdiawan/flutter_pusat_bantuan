import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_starter_provider/services/service.dart';

class AuthService extends Service{
  Future<Response> postLogin(var data) async {
    try {
      var url = '/login';

      var response = await postLogin2(url, data);
      print(response);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw ('data tidak ditemukan');
      }
    } on SocketException catch (_) {
      throw SocketException('no_internet');
    } catch (error) {
      if (error is DioError) {
        print(error.response.statusCode);
        throw (error.response.statusCode);
      }
    }
  }
}