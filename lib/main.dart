
import 'package:shared_preferences/shared_preferences.dart';
import 'package:client_apk/views/listScreen.dart';
import 'package:client_apk/views/detailScreen.dart';
import 'package:flutter/material.dart';
import 'views/loginScreen.dart';
import 'observers/TokenRouteObserver.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connexion | MADAGROUPAGE',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // '/': (context) => LoginScreen(),
        '/listScreen': (context) => ListScreen(),
        //   '/detailScreen': (context) => DetailScreen(),
      },
      home: LoginScreen(),
    );
  }
}
