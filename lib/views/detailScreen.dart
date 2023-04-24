import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:client_apk/views/loginScreen.dart';


class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  _DetailScreen createState() => _DetailScreen();
}

class _DetailScreen extends State<DetailScreen> {

   redirectToLoginScreen(){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen())
          );
    }

  @override
  Widget build(BuildContext context) {
      checkToken() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");
      if(token != null) {
        redirectToLoginScreen();
      }
    }

   
    checkToken();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF032547),
        title: Text(
          'Détails',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 1, 15, 0),
            child: Row(
              children: [
                Text(
                  'Réf: AKD20230314',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Color(0xFFFFFFFF),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: <Widget>[
                      Column(children: [
                        Container(
                          child: Center(
                             child: Image.asset("assets/images/hand.png",
                              height: 115)),
                          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 15.0),
                          height: 180,
                          decoration: BoxDecoration(color: Color(0xFF295078)),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 15.0),
                          height: 50,
                          decoration: BoxDecoration(color: Color(0xFFD4833B)),
                        ),
                      ]),

                      //desc
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 25, 0, 0),
                        child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  children: [
                                    Text(
                                      'Description: ',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 48, 48, 48),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'FIGURINE DEATH NOTE (BLACK)',
                                      style: TextStyle(
                                          color: Color(0xFF797878),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),

                      //poids
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 15, 0, 0),
                        child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  children: [
                                    Text(
                                      'Poids: ',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 48, 48, 48),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      '500g',
                                      style: TextStyle(
                                          color: Color(0xFF797878),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),

                      //desc
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 15, 0, 0),
                        child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  children: [
                                    Text(
                                      'Description: ',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 48, 48, 48),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'FIGURINE DEATH NOTE (BLACK)',
                                      style: TextStyle(
                                          color: Color(0xFF797878),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),

                      //desc
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 15, 0, 0),
                        child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  children: [
                                    Text(
                                      'Description: ',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 48, 48, 48),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'FIGURINE DEATH NOTE (BLACK)',
                                      style: TextStyle(
                                          color: Color(0xFF797878),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),

                      //desc
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 15, 0, 0),
                        child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  children: [
                                    Text(
                                      'Description: ',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 48, 48, 48),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'FIGURINE DEATH NOTE (BLACK)',
                                      style: TextStyle(
                                          color: Color(0xFF797878),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),

                      //desc
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 15, 0, 0),
                        child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  children: [
                                    Text(
                                      'Description: ',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 48, 48, 48),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'FIGURINE DEATH NOTE (BLACK)',
                                      style: TextStyle(
                                          color: Color(0xFF797878),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),

                      //desc
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 15, 0, 0),
                        child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  children: [
                                    Text(
                                      'Description: ',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 48, 48, 48),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'FIGURINE DEATH NOTE (BLACK)',
                                      style: TextStyle(
                                          color: Color(0xFF797878),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),

                      //desc
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 15, 0, 0),
                        child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  children: [
                                    Text(
                                      'Description: ',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 48, 48, 48),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'FIGURINE DEATH NOTE (BLACK)',
                                      style: TextStyle(
                                          color: Color(0xFF797878),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),

                      //desc
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 15, 0, 0),
                        child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Row(
                                  children: [
                                    Text(
                                      'Description: ',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 48, 48, 48),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'FIGURINE DEATH NOTE (BLACK)',
                                      style: TextStyle(
                                          color: Color(0xFF797878),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )),
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
