import 'package:client_apk/listScreen.dart';
// import 'package:client_apk/detailScreen.dart';
import 'package:flutter/material.dart';
import 'loginScreen.dart';

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
