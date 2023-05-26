import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:client_apk/models/pack_model.dart';
import 'package:client_apk/models/colis_model.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:client_apk/services/detail_service.dart';


class DetailScreen extends StatefulWidget {
  final String reference;

  const DetailScreen({required this.reference, Key? key}) : super(key: key);

  @override
  _DetailScreen createState() => _DetailScreen();
  
}

class _DetailScreen extends State<DetailScreen> {
  late SharedPreferences prefs;
  List<ColisModel> colisList = [];

  PackModel? package;

   @override
  void initState() {
    super.initState();
    print('ATO AM INIT');
    //get List colis from api
    _packList();
    initPrefs();
  }

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }
    
    _packList() async {
    
    String reference = widget.reference;
    print('REFERENCE');
    print(reference);
    try {
          List<ColisModel> rep = await DetailService().articleList(reference);
          print('REP');
          print(rep);
        if(rep != null){
          print('Package list fetched successfully');

           setState(() {
            colisList = rep; // Assuming the API response returns a list of packages
          });

        }
        else{
          //   Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (BuildContext context) => ChangeProfile(),
          //   ),
          // );
        }
      } on Exception catch (exception) {
        ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.danger,
            dialogDecoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
            title: "Erreur",
            text: exception.toString(),
            confirmButtonText: "OK",
            confirmButtonColor: const Color(0xFF3E72A4)));
      }

  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    //   checkToken() async {
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   String? token = prefs.getString("token");
    //   if(token != null) {
    //     redirectToLoginScreen();
    //   }
    // }

    // checkToken();
    void _showArticleList(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(0, 244, 244, 244),
                    blurRadius: 6,
                    offset: Offset(0, 2))
              ], borderRadius: BorderRadius.circular(0), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            " Mes articles ",
                            style: TextStyle(
                                color: Color(0xFF295078),
                                fontSize: 20,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        SizedBox(height: 20),
                        Expanded(
                          child: ListView.builder(
                            itemCount: colisList.length,
                            itemBuilder: (context, index) {
                              var colis = colisList[index];
                              return Padding(
                                padding: const EdgeInsets.all(3),
                                child: Container(
                                    padding:
                                        EdgeInsets.fromLTRB(5, 10, 10, 14),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0xFF295078),
                                            blurRadius: 6,
                                            offset: Offset(0, 2))
                                      ],
                                      color: Color(0xFF295078),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children:  [
                                        Container(
                                          height: 41, // set the height of the container
                                          width: 41, // set the width of the container
                                          child: Image.asset('assets/images/package.png'),
                                          padding: EdgeInsets.fromLTRB(12, 0, 5, 0),
                                        ),
                                        Text(
                                          "Colis: N° ${colis.numeroColis} ${colis.referenceColis} ",
                                          style: TextStyle(
                                              color: Color(0xFFEBEBEB),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          height: 1, 
                                          width: 150, 
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFCBCACA), 
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "Nom de l'article: ${colis.contenu} ",
                                          style: TextStyle(
                                              color: Color(0xFFEBEBEB),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(height: 2),
                                        Visibility(
                                            visible: colis.poids != null,
                                            child: Text(
                                              "Poids: ${colis.poids} Kg",
                                              style: TextStyle(
                                                color: Color(0xFFEBEBEB),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                        ),
                                        SizedBox(height: 2),
                                        Visibility(
                                            visible: colis.volume != null,
                                            child: Text(
                                              "Volume: ${colis.volume} m3",
                                              style: TextStyle(
                                                color: Color(0xFFEBEBEB),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                        ),
                                        SizedBox(height: 2),
                                        Visibility(
                                            visible: colis.nombre != null,
                                            child: Text(
                                              "Nombre: ${colis.nombre}",
                                              style: TextStyle(
                                                color: Color(0xFFEBEBEB),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                        ),
                                        SizedBox(height: 7),
                                        Container(
                                          padding: EdgeInsets.only(left: 14, top: 7, right: 14, bottom:7),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFD97E07),
                                            borderRadius: BorderRadius.circular(15), // Set the border radius value
                                          ),
                                          child: Text(
                                            "${colis.tarifEnvoiEUR} € ",
                                            style: TextStyle(
                                                color: Color(0xFFEBEBEB),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    )),
                              );
                            },
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          );
        },
      );
    }


    void _showPaymentList(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color(0xFF295078),
                    blurRadius: 6,
                    offset: Offset(0, 2))
              ], borderRadius: BorderRadius.circular(7), color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(3),
                                child: Container(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0xFF295078),
                                            blurRadius: 6,
                                            offset: Offset(0, 2))
                                      ],
                                      color: Color(0xFF295078),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "Date: 19/05/2023 ",
                                                style: TextStyle(
                                                    color: Color(0xFFEBEBEB),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Text(
                                                "Réf du paiement: 0011505368 ",
                                                style: TextStyle(
                                                    color: Color(0xFFEBEBEB),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ]),
                                        SizedBox(height: 2),
                                        Text(
                                          "Devise: 478 100 Ariary ",
                                          style: TextStyle(
                                              color: Color(0xFFEBEBEB),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          "Equivalence: 100 € ",
                                          style: TextStyle(
                                              color: Color(0xFFEBEBEB),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    )),
                              );
                            },
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          );
        },
      );
    }

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
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color(0xFF295078),
                    blurRadius: 6,
                    offset: Offset(0, 2))
              ], color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //DETAIL COLISAGE
                  Column(
                    children: [
                     Container(
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 41, // set the height of the container
                                width: 41, // set the width of the container
                                child: Image.asset('assets/images/sender.png'),
                                padding: EdgeInsets.fromLTRB(12, 0, 5, 0),
                              ),
                              Text(
                                'Expéditeur: Rakotoanirina Lova  ', //Expéditeur
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),   
                      SizedBox(height: 2.0), // Add spacing between the columns              
                      Container(
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 41, // set the height of the container
                                width: 41, // set the width of the container
                                child:
                                    Image.asset('assets/images/recipient.png'),
                                padding: EdgeInsets.fromLTRB(12, 0, 5, 0),
                              ),
                              Text(
                                "Destinataire: Rajaonson Fitia ", // Destinataire
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 9),
                  //ETAT
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left:15 ),
                    child: Column(
                      children: [
                        //LES 4 ETATS
                        //ETAT 1
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 15, // set the height of the container
                                width: 15, // set the width of the container
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 3),
                              Padding(
                                padding: const EdgeInsets.only(left:5.0),
                                child: Text(
                                  " En cours d'expédition ",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        //ETAT 2
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 15, // set the height of the container
                                width: 15, // set the width of the container
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 3),
                              Padding(
                                padding: const EdgeInsets.only(left:5.0),
                                child: Text(
                                  " Expédié (15/04/2023)",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        //ETAT 3
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 15, // set the height of the container
                                width: 15, // set the width of the container
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 3),
                              Padding(
                                padding: const EdgeInsets.only(left:5.0),
                                child: Text(
                                  " En attente de livraison",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                  
                        //ETAT 4
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 15, // set the height of the container
                                width: 15, // set the width of the container
                                decoration: BoxDecoration(
                                  color: Color(0xFFEC6701),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 3),
                              Padding(
                                padding: const EdgeInsets.only(left:5.0),
                                child: Text(
                                  " Livré le 20/04/2023)",
                                  style: TextStyle(
                                      color: Color(0xFFEC6701),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        // FIN 4 ETATS
                      ],
                    ),
                  ),
                  SizedBox(height: 9),
                  //MONTANT 
                  Container(
                    child: Column(
                      children: [
                        Container(
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 41, // set the height of the container
                                  width: 41, // set the width of the container
                                  child:
                                      Image.asset('assets/images/price.png'),
                                  padding: EdgeInsets.fromLTRB(12, 0, 5, 0),
                                ),
                                Text(
                                  'Montant: 200 € ', //Expéditeur
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),      
                        SizedBox(height: 2.0),
                        Container(
                              height: 30,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 41, // set the height of the container
                                    width: 41, // set the width of the container
                                    child: Image.asset(
                                        'assets/images/price.png'),
                                    padding: EdgeInsets.fromLTRB(12, 0, 5, 0),
                                  ),
                                  Text(
                                    "Reste à payer: 50 € ", // Destinataire
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
                SizedBox(height: 0.0),
                Stack(
                  children: [ GestureDetector(
                    onTap: () {
                      _showArticleList(context);
                    },
                    child: Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration:
                              BoxDecoration(color: Color.fromARGB(255, 221, 100, 1)),
                          child: Center(
                            child: Text(
                              'Liste des colis ',
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ), ]
                ),

          // GestureDetector(
          //     onTap: () {
          //     _showPaymentList(context);
          //   },
          //   child: Container(
          //       width: double.infinity,
          //       height: 50,
          //       decoration: BoxDecoration(
          //         color: Color(0xFF032547) ),
          //        child: Center(
          //       child: Text(
          //         ' Liste de paiements ',
          //         style: TextStyle(
          //             color: Color.fromARGB(255, 255, 255, 255),
          //             fontSize: 13,
          //             fontWeight: FontWeight.w500),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
