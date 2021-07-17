import 'package:flutter/material.dart';
import 'package:flutter_starter_provider/presentations/views/base_view.dart';
import 'package:flutter_starter_provider/providers/home_providers.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeProvider>(
      onModelReady: (model) => model.increment(),
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Home'),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              provider.increment();
            },
          ),
          body: Container(
            child: Center(
              child: Text(provider.number.toString(), style: TextStyle(fontSize: 32),),
            ),
          ),
        );
      },
    );
  }
}
