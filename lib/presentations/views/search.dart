import 'package:flutter/material.dart';
import 'package:flutter_starter_provider/configs/constants/view_state.dart';
import 'package:flutter_starter_provider/configs/router/router_app_string.dart';
import 'package:flutter_starter_provider/presentations/views/base_view.dart';
import 'package:flutter_starter_provider/providers/search_provider.dart';

class Search extends StatelessWidget {
  final String pertanyaan;
  const Search({Key key, this.pertanyaan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SearchProvider>(
      onModelReady: (model) => model.init(pertanyaan),
    builder: (context, provider, child){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
        ),
        body: provider.state== ViewState.Fetching ? Center(child: CircularProgressIndicator(),) : ListView(
            shrinkWrap: true,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width,
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.indigo,
                ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.zero,
                      //fillColor: Colors.grey[400],
                      filled: true,
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Ketik kata kunci',
                      hintStyle: TextStyle(fontSize: 18),
                      border:
                      OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    onFieldSubmitted: (value){
                      Navigator.popAndPushNamed(context, RouterAppStrings.search, arguments: {'pertanyaan' : value});
                    },
                  ),
              ),
              Column(
                  children: provider.search.map((e) => Card(
                    child: ListTile(
                      onTap: (){
                        Navigator.pushNamed(context, RouterAppStrings.detailBantuan, arguments: {'title': e.pertanyaan, 'id': e.id.toString()});
                      },
                      title: Text(e.pertanyaan),
                    ),
                  )).toList()
              ),
            ],
          ),
      );
    },
    );
  }
}
