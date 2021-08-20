import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_starter_provider/configs/locator.dart';
import 'package:flutter_starter_provider/models/DataTokenLoginModel.dart';
import 'package:flutter_starter_provider/providers/base_providers.dart';
import 'package:flutter_starter_provider/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProviders extends BaseProvider{
  AuthService authService = locator<AuthService>();
  Map dataLogin = {'email' : '', 'password' : ''};

  Future<bool> loginWithCredentials() async {
    try {
      Response res = await authService.postLogin(jsonEncode(this.dataLogin));
      print('asd222');
      if(res != null){
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setBool('isLogin', true);
        sharedPreferences.setString('token', res.data['token']);
        DataTokenLoginModel dataTokenLoginModel = dataTokenLoginModelFromJson(ascii.decode(base64.decode(base64.normalize(res.data['token'].split(".")[1]))));
        //await locator<SharedPreferencesHelper>().storeValueBool('isLogin', true);
        //await locator<SharedPreferencesHelper>().storeValueString('token', res.data['token']);
        return true;
      }else{
        return false;
      }
    } on Exception catch (e) {
      // emit(state.copyWith(status: FormzStatus.submissionFailure, exceptionError: e.toString()));
      return false;
    }
  }


}