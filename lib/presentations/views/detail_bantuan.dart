import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_provider/configs/constants/view_state.dart';
import 'package:flutter_starter_provider/presentations/views/base_view.dart';
import 'package:flutter_starter_provider/providers/submenu_kategori_provider.dart';

class DetailBantuan extends StatelessWidget {
  final String id;
  final String title;
  const DetailBantuan({Key key, this.title, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SubmenuKategoriProvider>(
      onModelReady: (model) => model.init(id),
      builder: (context, provider, child){
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
            backgroundColor: Colors.indigo,
          ),
          body: provider.state== ViewState.Fetching ? Center(child: CircularProgressIndicator(),) : ListView(
            children: [
              Column(
                children: provider.subkategori.map((e) => Container(
                  child: Text(e.pertanyaan),

                )).toList()
              )
              // Container(
              //   margin: EdgeInsets.fromLTRB(50, 16, 50, 16),
              //   child: Divider(
              //     color: Colors.grey,
              //   ),
              // ),
              // Column(
              //   children: [
              //     Container(
              //       child: Center(
              //           child: Text(
              //             'Merasa terbantu?', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              //           )
              //       ),
              //     ),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Container(
              //           child: Column(
              //             children: [
              //               IconButton(
              //                   iconSize: 42,
              //                   icon: CircleAvatar(child: Icon(Icons.thumb_up, color: Colors.grey,), backgroundColor: Colors.grey[300],),
              //                   onPressed: (){}
              //               ),
              //               Text('Ya', style: TextStyle(fontWeight: FontWeight.w700, color: Colors.grey),)
              //             ],
              //           ),
              //         ),
              //         Container(
              //           margin: EdgeInsets.only(left: 16),
              //           child: Column(
              //             children: [
              //               IconButton(
              //                 iconSize: 42,
              //                 icon: CircleAvatar(
              //                     child: Icon(
              //                       Icons.thumb_down,
              //                       color: Colors.grey,
              //                     ),
              //                     backgroundColor: Colors.grey[300]
              //                 ),
              //                 onPressed: (){},
              //               ),
              //               Text(
              //                 'Tidak',
              //                 style: TextStyle(
              //                     fontWeight: FontWeight.w700, color: Colors.grey
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              // Container(
              //     height: 70,
              //     width: double.maxFinite,
              //     decoration: BoxDecoration(
              //       color: Colors.grey[300],
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Container(
              //             margin: EdgeInsets.only(left: 16),
              //             child: Text(
              //               'Masih belum terjawab?',
              //               style: TextStyle(
              //                   fontSize: 16, fontWeight: FontWeight.w700),
              //             )),
              //         Container(
              //           margin: EdgeInsets.only(right: 16),
              //           child: RaisedButton(
              //             color: Colors.indigo,
              //             shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(20),
              //             ),
              //             onPressed: () {},
              //             child: Container(
              //               child: Text(
              //                 'Mulai Chat',
              //                 style: TextStyle(color: Colors.white),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ))
            ],
          ),
        );
      }
    );
  }
}
