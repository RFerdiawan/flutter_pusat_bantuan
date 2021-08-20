import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_starter_provider/configs/router/router_app_string.dart';
import 'package:flutter_starter_provider/presentations/views/base_view.dart';
import 'package:flutter_starter_provider/providers/login_providers.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginProviders>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(''
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(30, 100, 30, 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: TextFormField(
                    onChanged: (value){
                      provider.dataLogin['email'] = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email_rounded),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(20),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(30, 0, 30, 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: TextFormField(
                    obscureText: true,
                    onChanged: (value){
                      provider.dataLogin['password'] = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.vpn_key),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(20),
                    ),
                  ),
                ),
                SizedBox(

                  width: 370.0,
                  child: RaisedButton(
                    padding: EdgeInsets.all(16),
                    onPressed: () async{
                      print(provider.dataLogin);
                      EasyLoading.show(status:'Loading...', dismissOnTap: false,maskType: EasyLoadingMaskType.black);
                      bool load = await provider.loginWithCredentials();
                      EasyLoading.dismiss();
                      if(load){
                        Navigator.pushNamedAndRemoveUntil(context, RouterAppStrings.pusatBantuan, (route) => false);
                      } else{
                        EasyLoading.showToast('Login gagal');
                      }
                    },
                    child: Text('Login', style: TextStyle(color: Colors.white,),),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    color: Colors.indigo,
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}
