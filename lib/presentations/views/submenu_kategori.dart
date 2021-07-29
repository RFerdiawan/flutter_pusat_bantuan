import 'package:flutter/material.dart';
import 'package:flutter_starter_provider/configs/constants/view_state.dart';
import 'package:flutter_starter_provider/configs/router/router_app_string.dart';
import 'package:flutter_starter_provider/providers/base_providers.dart';
import 'package:flutter_starter_provider/providers/submenu_kategori_provider.dart';

import 'base_view.dart';

class SubmenuKategori extends StatelessWidget {
  final String categoryId;
  final String title;
  const SubmenuKategori({Key key, this.title, this.categoryId}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BaseView<SubmenuKategoriProvider>(
        onModelReady: (model)=> model.init(categoryId),
        builder: (context, provider, child){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text(title),
        ),
        body: provider.state== ViewState.Fetching ? Center(child: CircularProgressIndicator(),) : Container(
          child: ListView(
          children: [
            Column(
              children: provider.subkategori.map((e) => Card(
                child: ListTile(
                  onTap: (){
                    Navigator.pushNamed(context, RouterAppStrings.detailBantuan, arguments: {'title': e.pertanyaan, 'id': e.id.toString()});
                  },
                  title: Text(e.pertanyaan),
                ),
              )).toList()
            )
          ],
        ),
        ),
      );
    }
    );
  }
}
