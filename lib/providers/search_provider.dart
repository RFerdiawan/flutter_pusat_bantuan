import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_starter_provider/configs/constants/view_state.dart';
import 'package:flutter_starter_provider/configs/locator.dart';
import 'package:flutter_starter_provider/models/DataSubkategoriModel.dart';
import 'package:flutter_starter_provider/providers/base_providers.dart';
import 'package:flutter_starter_provider/services/subcategory_service.dart';

class SearchProvider extends BaseProvider{
  List<DataSubkategoriModel> search;

  SubcategoryService _services = locator<SubcategoryService>();
  Future init (String pertanyaan) async{
    try{
      setState(ViewState.Fetching);
      search = await _services.getPencarian(pertanyaan);
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

