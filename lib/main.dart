
import 'package:client_apk/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:client_apk/views/listScreen.dart';
import 'package:client_apk/views/signinScreen.dart';
import 'package:client_apk/views/detailScreen.dart';
import 'package:flutter/material.dart';
import 'views/loginScreen.dart';
import 'views/changePassword.dart';
import 'package:get/get.dart';


void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Connexion | MADAGROUPAGE',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.login,
      routes: Routes.routes,
    );
  }
}
