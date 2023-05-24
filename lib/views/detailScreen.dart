import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:client_apk/models/colis_model.dart';
import 'package:client_apk/services/detail_service.dart';
import 'package:art_sweetalert/art_sweetalert.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  _DetailScreen createState() => _DetailScreen();
}

class _DetailScreen extends State<DetailScreen> {
  late SharedPreferences prefs;
  // List<ColisModel> ListeColis = [];

  //  @override
  // void initState() {
  //   super.initState();
  //   print('ATO AM INIT');
  //   //get List colis from api
  //   _packList();
  //   initPrefs();
  // }

  // Future<void> initPrefs() async {
  //   prefs = await SharedPreferences.getInstance();
  // }

  //   _packList() async {

  //   try {
  //       List<ColisModel> rep = await DetailService()
  //         .packList();
  //         print('REP');
  //         print(rep);
  //       if(rep != null){
  //         print('Package list fetched successfully');

  //          setState(() {
  //           ListeColis = rep; // Assuming the API response returns a list of packages
  //         });

  //       }
  //       else{
  //         //   Navigator.push(
  //         //   context,
  //         //   MaterialPageRoute(
  //         //     builder: (BuildContext context) => ChangeProfile(),
  //         //   ),
  //         // );
  //       }
  //     } on Exception catch (exception) {
  //       ArtSweetAlert.show(
  //         context: context,
  //         artDialogArgs: ArtDialogArgs(
  //           type: ArtSweetAlertType.danger,
  //           dialogDecoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(20)),
  //           title: "Erreur",
  //           text: exception.toString(),
  //           confirmButtonText: "OK",
  //           confirmButtonColor: const Color(0xFF3E72A4)));
  //     }

  // }

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
                            itemCount: 10,
                            itemBuilder: (context, index) {
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
                                          "Colis: N° 1 FEA_000X ",
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
                                          "Nom de l'article: SmartWatch ",
                                          style: TextStyle(
                                              color: Color(0xFFEBEBEB),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          "Poids/Nombre/Volume: 10kg ",
                                          style: TextStyle(
                                              color: Color(0xFFEBEBEB),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(height: 7),
                                        Container(
                                          padding: EdgeInsets.only(left: 14, top: 7, right: 14, bottom:7),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFD97E07),
                                            borderRadius: BorderRadius.circular(15), // Set the border radius value
                                          ),
                                          child: Text(
                                            "100 € ",
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
                  Row(
                    children: [
                      Expanded(
                        child: Container(
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
                                'Rajaonarison Moreno ', //Expéditeur
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 2.0),
                      Expanded(
                        child: Container(
                          height: 30,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ),
                      // Expanded(
                      //   child: Container(
                      //     color: Colors.green,
                      //     height: 30,
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(3.0),
                      //       child: Image(
                      //         image: AssetImage('assets/images/fleche.png'), // Replace 'your_image.png' with your actual image path
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(width: 2.0), // Add spacing between the columns
                      Expanded(
                        child: Container(
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
                                "Rajaonson Fitia ", // Destinataire
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

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
                                  " Livré le 20/04/2023 (Récepteur: Rabeharijaona Ranto)",
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

                  //MONTANT 
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
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
                        ),
                        SizedBox(width: 2.0),
                        Expanded(
                          child: Container(
                            height: 30,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Icon(
                                Icons.arrow_forward,
                                color: Color.fromARGB(0, 255, 153, 0),
                              ),
                            ),
                          ),
                        ), 
                        Expanded(
                          child: Container(
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            SizedBox(height: 3.0),

            GestureDetector(
              onTap: () {
                _showArticleList(context);
              },
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
