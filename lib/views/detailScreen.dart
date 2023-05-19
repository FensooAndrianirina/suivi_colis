import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  _DetailScreen createState() => _DetailScreen();
}

class _DetailScreen extends State<DetailScreen> {
  

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
              ], 
              borderRadius: BorderRadius.circular(7),
              color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            "ETAT:  En cours d'expédition - Date de reception: 20/05/2023 ",
                            style: TextStyle(
                                color: Color(0xFF295078),
                                fontSize: 12,
                                fontWeight: FontWeight.w800),
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
                                        Text(
                                          "Nom de l'article: Smartwatch ",
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
                                        SizedBox(height: 2),
                                        Text(
                                          "Montant: 100 € ",
                                          style: TextStyle(
                                              color: Color(0xFFEBEBEB),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
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
    

  void _showPackageList(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {
              _showArticleList(context);
            },
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(3),
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFF295078),
                                blurRadius: 6,
                                offset: Offset(0, 2))
                          ],
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                            width: double.infinity,
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    "ETAT:  En cours d'expédition - Date de reception: 20/05/2023 ",
                                    style: TextStyle(
                                        color: Color(0xFF295078),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                                SizedBox(height: 3),
                                Center(
                                  child: Text(
                                    "Nom du colis: COLIS TSY AIKO ",
                                    style: TextStyle(
                                        color: Color(0xFF295078),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  );
                }),
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
                                                fontWeight: FontWeight.w700),
                                          ),
                                           Text(
                                            "Réf du paiement: 0011505368 ",
                                            style: TextStyle(
                                                color: Color(0xFFEBEBEB),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700),
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
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFF295078),
                        blurRadius: 6,
                        offset: Offset(0, 2))
                  ],
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //1REF
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 41, // set the height of the container
                          width: 41, // set the width of the container
                          child: Image.asset('assets/images/desc.png'),
                          padding: EdgeInsets.fromLTRB(12, 0, 5, 0),
                        ),
                        Text(
                          'Expéditeur: ',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'FR_20230517_001',
                          style: TextStyle(
                              color: Color(0xFF797878),
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  //2DESCRIPTION
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 41, // set the height of the container
                          width: 41, // set the width of the container
                          child: Image.asset('assets/images/etat.png'),
                          padding: EdgeInsets.fromLTRB(11, 0, 5, 0),
                        ),
                        Text(
                          "Destinataire: ",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          // '${package.dateEnvoi}',
                          '17/05/2023',
                          style: TextStyle(
                              color: Color(0xFF797878),
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  //3ETAT
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 42, // set the height of the container
                          width: 42, // set the width of the container
                          child: Image.asset('assets/images/package.png'),
                          padding: EdgeInsets.fromLTRB(12, 0, 5, 0),
                        ),
                        Text(
                          'Lieu de départ: ',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '2',
                          style: TextStyle(
                              color: Color(0xFF797878),
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),

                  //4EXPEDITEUR
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 42, // set the height of the container
                          width: 42, // set the width of the container
                          child: Image.asset('assets/images/sender.png'),
                          padding: EdgeInsets.fromLTRB(12, 0, 5, 0),
                        ),
                        Text(
                          'Lieu de destination: ',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Rakoto',
                          style: TextStyle(
                              color: Color(0xFF797878),
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),

                  //5DESTINATAIRE
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 42, // set the height of the container
                          width: 42, // set the width of the container
                          child: Image.asset('assets/images/recipient.png'),
                          padding: EdgeInsets.fromLTRB(12, 0, 5, 0),
                        ),
                        Text(
                          "Date d'envoi prévue",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Rabe',
                          style: TextStyle(
                              color: Color(0xFF797878),
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),

                  //6MONTANT
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 42, // set the height of the container
                          width: 42, // set the width of the container
                          child: Image.asset('assets/images/price.png'),
                          padding: EdgeInsets.fromLTRB(12, 0, 5, 0),
                        ),
                        Text(
                          'Moyen: ',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '220 €',
                          style: TextStyle(
                              color: Color(0xFF797878),
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  //7REF
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 41, // set the height of the container
                          width: 41, // set the width of the container
                          child: Image.asset('assets/images/desc.png'),
                          padding: EdgeInsets.fromLTRB(12, 0, 5, 0),
                        ),
                        Text(
                          "Type d'envoi: ",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'FR_20230517_001',
                          style: TextStyle(
                              color: Color(0xFF797878),
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  //8DESCRIPTION
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 41, // set the height of the container
                          width: 41, // set the width of the container
                          child: Image.asset('assets/images/etat.png'),
                          padding: EdgeInsets.fromLTRB(11, 0, 5, 0),
                        ),
                        Text(
                          "Type de reception: ",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          // '${package.dateEnvoi}',
                          '17/05/2023',
                          style: TextStyle(
                              color: Color(0xFF797878),
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  //9ETAT
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 42, // set the height of the container
                          width: 42, // set the width of the container
                          child: Image.asset('assets/images/package.png'),
                          padding: EdgeInsets.fromLTRB(12, 0, 5, 0),
                        ),
                        Text(
                          'Montant: ',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '2',
                          style: TextStyle(
                              color: Color(0xFF797878),
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),

                  //10EXPEDITEUR
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 42, // set the height of the container
                          width: 42, // set the width of the container
                          child: Image.asset('assets/images/sender.png'),
                          padding: EdgeInsets.fromLTRB(12, 0, 5, 0),
                        ),
                        Text(
                          'Extra: ',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Rakoto',
                          style: TextStyle(
                              color: Color(0xFF797878),
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),

                  //11DESTINATAIRE
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 42, // set the height of the container
                          width: 42, // set the width of the container
                          child: Image.asset('assets/images/recipient.png'),
                          padding: EdgeInsets.fromLTRB(12, 0, 5, 0),
                        ),
                        Text(
                          'Nombre de colis: ',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '10',
                          style: TextStyle(
                              color: Color(0xFF797878),
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),

                  //12MONTANT
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 42, // set the height of the container
                          width: 42, // set the width of the container
                          child: Image.asset('assets/images/price.png'),
                          padding: EdgeInsets.fromLTRB(12, 0, 5, 0),
                        ),
                        Text(
                          'Montant total: ',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          '220 €',
                          style: TextStyle(
                              color: Color(0xFF797878),
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
              ],
            ) 
          ),


       
          GestureDetector(
             onTap: () {
              _showPackageList(context);
            },
            child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 221, 100, 1) ),
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


          GestureDetector(
              onTap: () {
              _showPaymentList(context);
            },
            child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFF032547) ),
                 child: Center(
                child: Text(
                  ' Liste de paiements ',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
