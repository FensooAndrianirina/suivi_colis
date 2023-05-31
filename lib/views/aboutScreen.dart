import 'package:client_apk/views/signinScreen.dart';
import 'package:client_apk/views/loginScreen.dart';
import 'package:client_apk/views/listScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:client_apk/views/textField_component.dart';
import 'package:client_apk/routes.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:client_apk/routes.dart';
import 'package:client_apk/services/reset_password_service.dart';
import '../config/const.dart';
import 'package:dio/dio.dart';


class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> { 

  Widget buildText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            'A propos',
            style: TextStyle(
            color: Color(0xff295078),
            fontSize: 20    ,
            fontWeight: FontWeight.w900),
          ),
        )
      ],
    );
  }

  Widget buildDivider(){
    return Container(
      width: double.infinity, // Largeur maximale
      height: 1, // Hauteur de la ligne
      color: Colors.grey, // Couleur de la ligne
      child: SizedBox(width: 200), // Définir une largeur personnalisée pour la ligne
    );
  } 

  Widget buildContent(){
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          columns: [
            DataColumn(label: Wrap(
              children: [
                Text('APPLICATION MADAGROUPAGE v0.1', style: TextStyle(color: Color(0xFF2F3943))),
              ],
            )),

          ],
          rows: [
            DataRow(cells: [
              DataCell(Row(
                children: [
                  Text('Copyright © 2023', style: TextStyle(color: Color(0xFF2F3943)), softWrap: true),
                ],
              )),
            ]),
            DataRow(cells: [
              DataCell(Row(
                children: [
                  Text('Tous droits réservés', style: TextStyle(color: Color(0xFF2F3943)), softWrap: true),
                ],
              )),
            ]),
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
         leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
              Navigator.push(
              context,
              // MaterialPageRoute(builder: (context) => ListScreen()),
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
        ),
        backgroundColor: Color(0xFF032547),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.white,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                          SizedBox(height: 10),
                          Container(
                          padding: EdgeInsets.fromLTRB(15, 40, 15, 15),
                          child: Center(
                              child: Image.asset("assets/images/info.png", height: 100,
                                  )
                               ),       
                          ),
                          SizedBox(height: 3),
                          Container(
                            padding: EdgeInsets.fromLTRB(43, 5, 43, 0),
                              child: Column(
                                children: [
                                  buildText(),
                                  SizedBox(height:33),
                                  buildDivider(),
                                  SizedBox(height:15),
                                  buildContent()
                            ],
                          ),    
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
