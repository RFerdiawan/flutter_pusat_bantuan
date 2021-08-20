import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_starter_provider/models/DataKategoriModel.dart';
import 'package:flutter_starter_provider/models/DataSubkategoriModel.dart';
import 'package:flutter_starter_provider/services/service.dart';

class SubcategoryService extends Service{
  Future getSubcategory(String categoryId) async {
    try {
      var url = '/subcategory/$categoryId';

      var response = await get(url);
      print(response.data);
      if (response.statusCode == 200) {
        List<DataSubkategoriModel>dataSubkategoriModel= dataSubkategoriModelFromJson(jsonEncode(response.data));
        return dataSubkategoriModel;
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

  Future getDetails(String id) async {
    try {
      var url = '/subcategory/$id/details';

      var response = await get(url);
      print(response.data);
      if (response.statusCode == 200) {
        List<DataSubkategoriModel>dataSubkategoriModel= dataSubkategoriModelFromJson(jsonEncode(response.data));
        return dataSubkategoriModel;
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

  Future getPertanyaan() async {
    try {
      var url = '/subcategory';

      var response = await get(url);
      print(response.data);
      if (response.statusCode == 200) {
        List<DataSubkategoriModel>dataSubkategoriModel= dataSubkategoriModelFromJson(jsonEncode(response.data));
        return dataSubkategoriModel;
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

  Future getPencarian(String pertanyaan) async {
    try {
      var url = '/search?pertanyaan=$pertanyaan';

      var response = await get(url);
      print(response.data);
      if (response.statusCode == 200) {
        List<DataSubkategoriModel>dataSubkategoriModel= dataSubkategoriModelFromJson(jsonEncode(response.data));
        return dataSubkategoriModel;
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