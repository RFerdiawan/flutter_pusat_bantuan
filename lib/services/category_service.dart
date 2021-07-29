import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_starter_provider/models/DataKategoriModel.dart';
import 'package:flutter_starter_provider/services/service.dart';

class CategoryService extends Service{
  Future getCategory() async {
    try {
      var url = '/category';

      var response = await get(url);
      print(response.data);
      if (response.statusCode == 200) {
        List<DataKategoriModel>dataKategoriModel= dataKategoriModelFromJson(jsonEncode(response.data));
        return dataKategoriModel;
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