import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_starter_provider/configs/constants/view_state.dart';
import 'package:flutter_starter_provider/configs/locator.dart';
import 'package:flutter_starter_provider/configs/router/router_app_string.dart';
import 'package:flutter_starter_provider/models/DataKategoriModel.dart';
import 'package:flutter_starter_provider/models/DataSubkategoriModel.dart';
import 'package:flutter_starter_provider/presentations/views/login.dart';
import 'package:flutter_starter_provider/providers/base_providers.dart';
import 'package:flutter_starter_provider/services/category_service.dart';
import 'package:flutter_starter_provider/services/subcategory_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PusatBantuanProvider extends BaseProvider{

  List<DataKategoriModel> kategori =[];
  List<DataSubkategoriModel> subkategori =[];
  CategoryService _service = locator<CategoryService>();
  SubcategoryService _services = locator<SubcategoryService>();
  Future init () async{
    try{
      setState(ViewState.Fetching);
      kategori = await _service.getCategory();
      subkategori = await _services.getPertanyaan();
      setState(ViewState.Idle);
    }
    on SocketException catch(e){
      setState(ViewState.ErrConnection);
    }

    catch(e){
      setState(ViewState.FetchNull);
    }
  }

  String greeting() {
    var jam = DateTime.now().hour;
    if (jam < 12) {
      return 'Pagi';
    }
    if (jam < 15) {
      return 'Siang';
    }
    if(jam < 18){
      return 'Sore';
    }
    return 'Malam';
  }

  SimpleModalDialog(context){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          content: Text('Apakah anda yakin?'),
          actions: [
            FlatButton(
                onPressed: () async{
                  Navigator.pop(context);
                  EasyLoading.show(status: "Loading..", maskType: EasyLoadingMaskType.black, dismissOnTap: false);
                  SharedPreferences preferences = await SharedPreferences.getInstance();
                  preferences.clear();
                  EasyLoading.dismiss();
                  Navigator.pushNamedAndRemoveUntil(context, RouterAppStrings.login, (route) => false);
                },
                child: Text('Ya')
            ),
            FlatButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text('Tidak')
            ),
          ]
        );
      }
    );
  }

}