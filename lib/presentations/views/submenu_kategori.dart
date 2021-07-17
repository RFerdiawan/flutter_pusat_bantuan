import 'package:flutter/material.dart';

class SubmenuKategori extends StatelessWidget {
  final String title;
  const SubmenuKategori({Key key, this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(title),
      ),
    );
  }
}
