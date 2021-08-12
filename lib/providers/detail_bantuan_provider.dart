import 'dart:io';

import 'package:flutter_starter_provider/configs/constants/view_state.dart';
import 'package:flutter_starter_provider/configs/locator.dart';
import 'package:flutter_starter_provider/models/DataSubkategoriModel.dart';
import 'package:flutter_starter_provider/providers/base_providers.dart';
import 'package:flutter_starter_provider/services/subcategory_service.dart';

class DetailBantuanProvider extends BaseProvider{
  List<DataSubkategoriModel> subkategori =[];

  SubcategoryService _services = locator<SubcategoryService>();
  Future init (String id) async{
    try{
      setState(ViewState.Fetching);
      subkategori = await _services.getDetails(id);
      setState(ViewState.Idle);
    }
    on SocketException catch(e){
      setState(ViewState.ErrConnection);
    }

    catch(e){
      setState(ViewState.FetchNull);
    }
  }
}