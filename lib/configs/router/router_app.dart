import 'package:flutter/material.dart';
import 'package:flutter_starter_provider/configs/router/router_app_string.dart';
import 'package:flutter_starter_provider/presentations/views/detail_bantuan.dart';
import 'package:flutter_starter_provider/presentations/views/home.dart';
import 'package:flutter_starter_provider/presentations/views/login.dart';
import 'package:flutter_starter_provider/presentations/views/pusat_bantuan.dart';
import 'package:flutter_starter_provider/presentations/views/submenu_kategori.dart';

class RouterApp {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterAppStrings.home2:
        return MaterialPageRoute(builder: (_) => Home()
        );
        break;
      case RouterAppStrings.login:
        return MaterialPageRoute(builder: (_) => Login(),
        );
        break;
      case RouterAppStrings.pusatBantuan:
        return MaterialPageRoute(builder: (_) => PusatBantuan()
        );
        break;
      case RouterAppStrings.detailBantuan:
        return MaterialPageRoute(builder: (_) => DetailBantuan()
        );
        break;
      case RouterAppStrings.submenuKategori:
        var data = settings.arguments;
        Map data2 = data;
        return MaterialPageRoute(builder: (_) => SubmenuKategori(title: data2['title'],categoryId: data2['categoryId'],)
        );
        break;
      default:
        return null;
    }
  }
}