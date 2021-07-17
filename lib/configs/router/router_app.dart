import 'package:flutter/material.dart';
import 'package:flutter_starter_provider/configs/router/router_app_string.dart';
import 'package:flutter_starter_provider/presentations/views/detail_bantuan.dart';
import 'package:flutter_starter_provider/presentations/views/home.dart';
import 'package:flutter_starter_provider/presentations/views/pusat_bantuan.dart';
import 'package:flutter_starter_provider/presentations/views/submenu_kategori.dart';

class RouterApp {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterAppStrings.home2:
        return MaterialPageRoute(builder: (_) => Home()
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
        String title = settings.arguments;
        return MaterialPageRoute(builder: (_) => SubmenuKategori(title: title,)
        );
        break;
      default:
        return null;
    }
  }
}