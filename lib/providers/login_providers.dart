import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_starter_provider/configs/locator.dart';
import 'package:flutter_starter_provider/providers/base_providers.dart';
import 'package:flutter_starter_provider/services/auth_service.dart';

class LoginProviders extends BaseProvider{
  AuthService authService = locator<AuthService>();
  Map dataLogin = {'email' : '', 'password' : ''};

  Future<bool> loginWithCredentials() async {
    try {
      Response res = await authService.postLogin(jsonEncode(this.dataLogin));
      print(res);
      if(res != null){
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