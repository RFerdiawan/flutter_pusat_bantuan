import 'package:flutter_starter_provider/presentations/views/detail_bantuan.dart';
import 'package:flutter_starter_provider/presentations/views/submenu_kategori.dart';
import 'package:flutter_starter_provider/providers/home_providers.dart';
import 'package:flutter_starter_provider/providers/login_providers.dart';
import 'package:flutter_starter_provider/providers/main_provider.dart';
import 'package:flutter_starter_provider/providers/pusat_bantuan_provider.dart';
import 'package:flutter_starter_provider/providers/submenu_kategori_provider.dart';
import 'package:flutter_starter_provider/services/api_interceptors.dart';
import 'package:flutter_starter_provider/services/auth_service.dart';
import 'package:flutter_starter_provider/services/category_service.dart';
import 'package:flutter_starter_provider/services/subcategory_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  //  init injected file
  locator.registerLazySingleton(() => ApiInterceptors());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => CategoryService());
  locator.registerLazySingleton(() => SubcategoryService());
  locator.registerFactory(() => HomeProvider());
  locator.registerFactory(() => LoginProviders());
  locator.registerFactory(() => PusatBantuanProvider());
  locator.registerFactory(() => MainProvider());
  locator.registerFactory(() => SubmenuKategoriProvider());


}