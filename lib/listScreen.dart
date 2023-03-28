import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:client_apk/detailScreen.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreen createState() => _ListScreen();
}

class _ListScreen extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF032547),
        title: Text(
          'Liste de colis - MDG',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        automaticallyImplyLeading: false, 
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // do something
            },
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
                color: Color.fromARGB(255, 248, 248, 248),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 30.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //TOUS MES COLIS
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Color(0xFF295078),
                          ),
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          height: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height:
                                        47, // set the height of the container
                                    width: 47, // set the width of the container
                                    child: Image.asset('images/checklist.png'),
                                    padding: EdgeInsets.fromLTRB(12, 0, 5, 0),
                                  ),
                                  Text(
                                    'TOUS MES COLIS:',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    ' 12',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ))
                            ],
                          )),

                      SizedBox(height: 15),

                      //COLIS 1
                      Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 17),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                    offset: Offset(0, 2))
                              ],
                              color: Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //REF
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height:
                                          41, // set the height of the container
                                      width:
                                          41, // set the width of the container
                                      child: Image.asset('images/desc.png'),
                                      padding: EdgeInsets.fromLTRB(12, 0, 5, 0),
                                    ),
                                    Text(
                                      'Réf: ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      '00120230323',
                                      style: TextStyle(
                                          color: Color(0xFF797878),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              //DESCRIPTION
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height:
                                          41, // set the height of the container
                                      width:
                                          41, // set the width of the container
                                      child: Image.asset('images/package.png'),
                                      padding: EdgeInsets.fromLTRB(11, 0, 5, 0),
                                    ),
                                    Text(
                                      'Description: ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      'FIGURINE DEATH NOTE (BLACK)',
                                      style: TextStyle(
                                          color: Color(0xFF797878),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              //ETAT
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height:
                                          42, // set the height of the container
                                      width:
                                          42, // set the width of the container
                                      child: Image.asset('images/etat.png'),
                                      padding: EdgeInsets.fromLTRB(12, 0, 5, 0),
                                    ),
                                    Text(
                                      'Etat: ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      'En attente d\'expédition',
                                      style: TextStyle(
                                          color: Color(0xFF797878),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () => {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailScreen()),
                                          )
                                        },
                                        style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.all(13),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            foregroundColor: Colors.white,
                                            backgroundColor: Color(0xFFD4833B)),
                                        child: Row(children: [
                                          Text(
                                            'Voir détails',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Icon(
                                            Icons.chevron_right,
                                            color: Colors.white,
                                          ),
                                        ]),
                                      ),
                                    ],
                                  ))
                            ],
                          )),
                      SizedBox(height: 7),
                      //COLIS 2
                      Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                    offset: Offset(0, 2))
                              ],
                              color: Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //REF
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height:
                                          41, // set the height of the container
                                      width:
                                          41, // set the width of the container
                                      child: Image.asset('images/desc.png'),
                                      padding: EdgeInsets.fromLTRB(12, 0, 5, 0),
                                    ),
                                    Text(
                                      'Réf: ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      '00220230323',
                                      style: TextStyle(
                                          color: Color(0xFF797878),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              //DESCRIPTION
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height:
                                          41, // set the height of the container
                                      width:
                                          41, // set the width of the container
                                      child: Image.asset('images/package.png'),
                                      padding: EdgeInsets.fromLTRB(11, 0, 5, 0),
                                    ),
                                    Text(
                                      'Description: ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      'FIGURINE DEATH NOTE (BLACK)',
                                      style: TextStyle(
                                          color: Color(0xFF797878),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              //ETAT
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height:
                                          42, // set the height of the container
                                      width:
                                          42, // set the width of the container
                                      child: Image.asset('images/etat.png'),
                                      padding: EdgeInsets.fromLTRB(12, 0, 5, 0),
                                    ),
                                    Text(
                                      'Etat: ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      'En transit',
                                      style: TextStyle(
                                          color: Color(0xFF797878),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      SizedBox(height: 7),

                      //COLIS 3
                      Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                    offset: Offset(0, 2))
                              ],
                              color: Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //REF
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height:
                                          41, // set the height of the container
                                      width:
                                          41, // set the width of the container
                                      child: Image.asset('images/desc.png'),
                                      padding: EdgeInsets.fromLTRB(12, 0, 5, 0),
                                    ),
                                    Text(
                                      'Réf: ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      'TEST20230323',
                                      style: TextStyle(
                                          color: Color(0xFF797878),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              //DESCRIPTION
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height:
                                          41, // set the height of the container
                                      width:
                                          41, // set the width of the container
                                      child: Image.asset('images/package.png'),
                                      padding: EdgeInsets.fromLTRB(11, 0, 5, 0),
                                    ),
                                    Text(
                                      'Description: ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      'FIGURINE DEATH NOTE (BLACK)',
                                      style: TextStyle(
                                          color: Color(0xFF797878),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              //ETAT
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height:
                                          42, // set the height of the container
                                      width:
                                          42, // set the width of the container
                                      child: Image.asset('images/etat.png'),
                                      padding: EdgeInsets.fromLTRB(12, 0, 5, 0),
                                    ),
                                    Text(
                                      'Etat: ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      'En transit',
                                      style: TextStyle(
                                          color: Color(0xFF797878),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      SizedBox(height: 7),

                      // COLIS 4
                      Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                    offset: Offset(0, 2))
                              ],
                              color: Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //REF
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height:
                                          41, // set the height of the container
                                      width:
                                          41, // set the width of the container
                                      child: Image.asset('images/desc.png'),
                                      padding: EdgeInsets.fromLTRB(12, 0, 5, 0),
                                    ),
                                    Text(
                                      'Réf: ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      'TEST20230323',
                                      style: TextStyle(
                                          color: Color(0xFF797878),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              //DESCRIPTION
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height:
                                          41, // set the height of the container
                                      width:
                                          41, // set the width of the container
                                      child: Image.asset('images/package.png'),
                                      padding: EdgeInsets.fromLTRB(11, 0, 5, 0),
                                    ),
                                    Text(
                                      'Description: ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      'FIGURINE DEATH NOTE (BLACK)',
                                      style: TextStyle(
                                          color: Color(0xFF797878),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              //ETAT
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height:
                                          42, // set the height of the container
                                      width:
                                          42, // set the width of the container
                                      child: Image.asset('images/etat.png'),
                                      padding: EdgeInsets.fromLTRB(12, 0, 5, 0),
                                    ),
                                    Text(
                                      'Etat: ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      'En attente de livraison',
                                      style: TextStyle(
                                          color: Color(0xFF797878),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      SizedBox(height: 7),
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
