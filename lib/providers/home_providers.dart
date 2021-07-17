import 'package:flutter_starter_provider/providers/base_providers.dart';

class HomeProvider extends BaseProvider{
  int number = 0;

  void increment(){
    number++;
    notifyListeners();
  }
}