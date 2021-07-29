import 'package:flutter/material.dart';
import 'package:flutter_starter_provider/presentations/views/home.dart';
import 'package:flutter_starter_provider/presentations/views/login.dart';
import 'package:flutter_starter_provider/presentations/views/pusat_bantuan.dart';
import 'package:flutter_starter_provider/providers/main_provider.dart';

import 'configs/locator.dart';
import 'configs/router/router_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  MainProvider mainProvider = locator<MainProvider>();
  mainProvider.onStartApp().then((value) => runApp(MyApp(initialRoute: value,)));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  MyApp({this.initialRoute});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.indigo,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PusatBantuan(),//initialRoute == 'login' ? Login() : PusatBantuan(),
      onGenerateRoute: RouterApp.onGenerateRoute,

    );
  }
}

