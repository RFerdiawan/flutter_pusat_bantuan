import 'package:flutter/material.dart';
import 'package:flutter_starter_provider/configs/constants/view_state.dart';
import 'package:flutter_starter_provider/configs/router/router_app_string.dart';
import 'package:flutter_starter_provider/presentations/views/base_view.dart';
import 'package:flutter_starter_provider/providers/pusat_bantuan_provider.dart';

class PusatBantuan extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BaseView<PusatBantuanProvider>(
      onModelReady: (model)=> model.init(),
       builder: (context, provider, child){
         return Scaffold(
           appBar: AppBar(
             backgroundColor: Colors.indigo,
             title: Text('Pusat Bantuan'),
             actions: [
               Container(
               child: IconButton(
                 icon: Icon(Icons.logout),
                 onPressed: (){
                   provider.SimpleModalDialog(context);
                 },
               ),
             )],
           ),
           body: provider.state== ViewState.Fetching ? Center(child: CircularProgressIndicator(),) : Container(
             child: ListView(
               children: <Widget>[
                 Container(
                   margin: EdgeInsets.only(bottom: 8, left: 16, top: 16),
                   child: Text('Selamat ' + provider.greeting(),
                       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                 ),
                 Container(
                   margin: EdgeInsets.only(bottom: 16, left: 16),
                   child: Text(
                     'Ada yang bisa kami bantu ?',
                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                   ),
                 ),
                 Container(
                   margin: EdgeInsets.only(bottom: 16,left: 16, right: 16),
                   child: TextFormField(
                       decoration: InputDecoration(
                         contentPadding: EdgeInsets.zero,
                         //fillColor: Colors.grey[400],
                         filled: true,
                         prefixIcon: Icon(Icons.search),
                         hintText: 'Ketik kata kunci',
                         hintStyle: TextStyle(fontSize: 18),
                         border:
                         OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                       )),
                 ),
                 Container(
                   margin: EdgeInsets.only(bottom: 8, left: 16),
                   child: Text(
                     'Kategori',
                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                   ),
                 ),
                 SingleChildScrollView(
                   scrollDirection: Axis.horizontal,
                   // child: Row(
                   //   //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   //   children: <Widget>[
                   //
                   //     Container(
                   //       //margin: EdgeInsets.only(right: 8),
                   //       width: 90,
                   //       height: 100,
                   //       child: Column(
                   //         children: [
                   //           IconButton(
                   //             onPressed: (){
                   //               Navigator.pushNamed(context, RouterAppStrings.submenuKategori, arguments: "Top Up");
                   //             },
                   //             iconSize: 42,
                   //             icon: CircleAvatar(child: Icon(Icons.add)),
                   //           ),
                   //           Text('Top Up')
                   //         ],
                   //       ),
                   //     ),
                   //     Container(
                   //       //margin: EdgeInsets.only(right: 8),
                   //       width: 90,
                   //       height: 100,
                   //       child: Column(
                   //         children: [
                   //           IconButton(
                   //             onPressed: (){
                   //               Navigator.pushNamed(context, RouterAppStrings.submenuKategori, arguments: "Listrik PLN");
                   //             },
                   //             iconSize: 42,
                   //             icon: CircleAvatar(child: Icon(Icons.bolt)),
                   //           ),
                   //           Text('Listrik PLN')
                   //         ],
                   //       ),
                   //     ),
                   //     Container(
                   //       //margin: EdgeInsets.only(right: 8),
                   //       width: 90,
                   //       height: 100,
                   //       child: Column(
                   //         children: [
                   //           IconButton(
                   //             onPressed: (){
                   //               Navigator.pushNamed(context, RouterAppStrings.submenuKategori,arguments: "Pulsa");
                   //             },
                   //             iconSize: 42,
                   //             icon: CircleAvatar(child: Icon(Icons.smartphone)),
                   //           ),
                   //           Text('Pulsa')
                   //         ],
                   //       ),
                   //     ),
                   //     Container(
                   //       //margin: EdgeInsets.only(right: 8),
                   //       width: 90,
                   //       height: 100,
                   //       child: Column(
                   //         children: [
                   //           IconButton(
                   //             onPressed: (){
                   //               Navigator.pushNamed(context, RouterAppStrings.submenuKategori, arguments: "Voucher Game");
                   //             },
                   //             iconSize: 42,
                   //             icon: CircleAvatar(child: Icon(Icons.sports_esports_rounded)),
                   //           ),
                   //           Text('Voucher Game', textAlign: TextAlign.center,)
                   //         ],
                   //       ),
                   //     ),
                   //     Container(
                   //       //margin: EdgeInsets.only(right: 8),
                   //       width: 90,
                   //       height: 100,
                   //       child: Column(
                   //         children: [
                   //           IconButton(
                   //             onPressed: (){
                   //               Navigator.pushNamed(context, RouterAppStrings.submenuKategori, arguments: "Angsuran Kredit");
                   //             },
                   //             iconSize: 42,
                   //             icon: CircleAvatar(child: Icon(Icons.payment_rounded)),
                   //           ),
                   //           Text('Angsuran Kredit', textAlign: TextAlign.center,)
                   //         ],
                   //       ),
                   //     ),
                   //     Container(
                   //       //margin: EdgeInsets.only(right: 8),
                   //       width: 90,
                   //       height: 100,
                   //       child: Column(
                   //         children: [
                   //           IconButton(
                   //             onPressed: (){
                   //               Navigator.pushNamed(context, RouterAppStrings.submenuKategori, arguments: "Pengembalian Dana");
                   //             },
                   //             iconSize: 42,
                   //             icon: CircleAvatar( child: Image(image: AssetImage('assets/refund.png'),),)
                   //           ),
                   //           Text('Pengembalian Dana', textAlign: TextAlign.center,)
                   //         ],
                   //       ),
                   //     ),
                   //   ],
                   // ),
                   child: Row(
                     children: provider.kategori.map((e) => Container(
                       //margin: EdgeInsets.only(right: 8),
                       width: 80,
                       height: 100,
                       child: Column(
                         children: [
                           IconButton(
                             onPressed: (){
                               Navigator.pushNamed(context, RouterAppStrings.submenuKategori, arguments: {'title': e.category, 'categoryId': e.id.toString()});
                             },
                             iconSize: 42,
                             icon: CircleAvatar(child: Image(
                               width: 24,
                                 image: AssetImage(
                                     e.icon),
                             ),
                             ),
                           ),
                           Text(e.category,textAlign: TextAlign.center,)
                         ],
                       ),
                     ),).toList(),
                   ),
                 ),
                 Container(
                   margin: EdgeInsets.only(bottom: 16, left: 16),
                   child: Text(
                     'Yang sering ditanyakan',
                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                   ),
                 ),
                 ListView.builder(
                     itemCount: 6,
                     physics: NeverScrollableScrollPhysics(),
                     shrinkWrap: true,
                     itemBuilder: (BuildContext context, int index) {
                       return Column(
                           children: provider.subkategori.map((e) => Card(
                             child: ListTile(
                               onTap: (){
                                 Navigator.pushNamed(context, RouterAppStrings.detailBantuan, arguments: {'title': e.pertanyaan, 'id': e.id.toString()});
                               },
                               title: Text(e.pertanyaan),
                             ),
                           )).toList(),
                       );
                     }),
                 Container(
                   margin: EdgeInsets.only(top: 16,left: 16, bottom: 8),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Container(
                         child: Text(
                           'Hubungi kami',
                           style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                         ),
                       ),
                       Row(
                         children: [
                           Container(
                             margin: EdgeInsets.only(right: 8, top: 8),
                             child: IconButton(
                               onPressed: (){},
                               iconSize: 42,
                               splashColor: Colors.white,
                               icon: CircleAvatar(child: Icon(Icons.support_agent_rounded))
                             ),
                           ),
                           Text('Live Chat', style: TextStyle(fontSize: 16,),),
                         ],
                       ),
                       Row(
                         children: [
                           Container(
                             margin: EdgeInsets.only(right: 8),
                             child: IconButton(
                               onPressed: (){},
                               iconSize: 42,
                               splashColor: Colors.white,
                               icon: Image(image: AssetImage('assets/instagram.png'),),
                             ),
                           ),
                           Text('Instagram', style: TextStyle(fontSize: 16,),),
                         ],
                       ),
                       Row(
                         children: [
                           Container(
                             margin: EdgeInsets.only(right: 8),
                             child: IconButton(
                               onPressed: (){},
                               iconSize: 42,
                               splashColor: Colors.white,
                               icon: Image(image: AssetImage('assets/facebook.png'),),
                             ),
                           ),
                           Text('Facebook', style: TextStyle(fontSize: 16,),),
                         ],
                       ),
                     ],
                   ),
                 )
               ],
             ),
           ),
         );
       },
    );
  }
}