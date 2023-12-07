import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:client_apk/models/pack_model.dart';
import 'package:client_apk/models/user_model.dart';
import 'package:client_apk/models/package_model.dart';
import 'package:client_apk/models/colis_model.dart';
import 'package:client_apk/models/payment_model.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:client_apk/services/detail_service.dart';
import 'package:intl/intl.dart';
import '../utils/util.dart';

class DetailScreen extends StatefulWidget {
  final String reference;

  const DetailScreen({required this.reference, Key? key}) : super(key: key);

  @override
  _DetailScreen createState() => _DetailScreen();
}

class _DetailScreen extends State<DetailScreen> {
  late SharedPreferences prefs;
  List<ColisModel> colisList = [];
  List<PaymentModel> paymentList = [];

  PackModel? package;

  int? userId;

  // List<PackModel> packages = [];

  @override
  void initState() {
    super.initState();
    _packList();
    // package = new PackModel(reference: "reference", expediteur: "expediteur", destinataire: "destinataire", tarifEnvoiEUR: 100, tarifExtraEUR: 100, resteAPayerEUR: 100, lieuDepart: "lieuDepart", lieuDestination: "lieuDestination", dateExpedition: null, dateArrivee:null, dateLivraison:DateTime.parse("2023-04-20"), colis: []);

    initPrefs();
  }

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    UserModel user = await Util.getUser();
    userId = user.id;
  }

  _packList() async {
    String reference = widget.reference;
    // Start showing the loader
    setState(() {
      isLoading = true;
    });

    try {
      PackModel packModel = await DetailService().getPackageDetails(reference);

      if (packModel != null) {
        setState(() {
          package = packModel;
        });
      } else {
      }
    } on Exception catch (exception) {
      ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
              type: ArtSweetAlertType.danger,
              dialogDecoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              title: "Erreur",
              text: exception.toString(),
              confirmButtonText: "OK",
              confirmButtonColor: const Color(0xFF3E72A4)));
    }
    // Stop showing the loader
    setState(() {
      isLoading = false;
    });
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var expedition = package?.dateExpedition != null
        ? DateFormat('dd/MM/yyyy').format(package!.dateExpedition!)
        : null;
    var arrivee = package?.dateArrivee != null
        ? DateFormat('dd/MM/yyyy').format(package!.dateArrivee!)
        : null;
    var livraison = package?.dateLivraison != null
        ? DateFormat('dd/MM/yyyy').format(package!.dateLivraison!)
        : null;

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
                            itemCount: package?.colis.length,
                            itemBuilder: (context, index) {
                              var colis = package?.colis[index];

                              // var fArrivee = DateFormat('dd/MM/yyyy').format(package?.dateArrivee);
                              // var fLivraison = DateFormat('dd/MM/yyyy').format(package?.dateLivraison);

                              return Padding(
                                padding: const EdgeInsets.all(3),
                                child: Container(
                                    padding: EdgeInsets.fromLTRB(5, 10, 10, 14),
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
                                        Container(
                                          height:
                                              41, // set the height of the container
                                          width:
                                              41, // set the width of the container
                                          child: Image.asset(
                                              'assets/images/package.png'),
                                          padding:
                                              EdgeInsets.fromLTRB(12, 0, 5, 0),
                                        ),
                                        Text(
                                          "Colis: N° ${colis?.numeroColis} - ${colis?.referenceColis} ",
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
                                          "Article: ${colis?.contenu} ",
                                          style: TextStyle(
                                              color: Color(0xFFEBEBEB),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(height: 2),
                                        Visibility(
                                          visible: (colis?.poids != 0),
                                          child: Text(
                                            "Poids: ${colis?.poids} Kg",
                                            style: TextStyle(
                                              color: Color(0xFFEBEBEB),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Visibility(
                                          visible: (colis?.volume != 0),
                                          child: Text(
                                            "Volume: ${colis?.volume} m³",
                                            style: TextStyle(
                                              color: Color(0xFFEBEBEB),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 2),
                                        Visibility(
                                          visible: (colis?.nombre != 0),
                                          child: Text(
                                            "Nombre: ${colis?.nombre}",
                                            style: TextStyle(
                                              color: Color(0xFFEBEBEB),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 7),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 14,
                                              top: 7,
                                              right: 14,
                                              bottom: 7),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFD97E07),
                                            borderRadius: BorderRadius.circular(
                                                15), // Set the border radius value
                                          ),
                                          child: Text(
                                            "${colis?.tarifEnvoiEUR} € ",
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

    void _showPayment(BuildContext context, PackModel package) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "Ma liste de paiements",
                    style: TextStyle(
                      color: Color(0xFF295078),
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(height: 2),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: package.paiements.length,
                      itemBuilder: (context, index) {
                        var paiements = package.paiements[index];
                        var paiement = paiements.datePaiement != null
                            ? DateFormat('dd/MM/yyyy')
                                .format(paiements.datePaiement!)
                            : null;
                        var montantMGA = paiements.montantMGA;

                        return Padding(
                          padding: const EdgeInsets.all(3),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF295078),
                                  blurRadius: 6,
                                  offset: Offset(0, 2),
                                )
                              ],
                              color: Color(0xFF295078),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Référence: ${paiements.reference}",
                                      style: TextStyle(
                                        color: Color(0xFFEBEBEB),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      "Date: ${paiement != null ? '(' + paiement + ')' : ''}",
                                      style: TextStyle(
                                        color: Color(0xFFEBEBEB),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "Montant: ${paiements.montantEUR} €  ${montantMGA != null ? '($montantMGA Ariary)' : ''}",
                                  style: TextStyle(
                                    color: Color(0xFFEBEBEB),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "Mode de paiement: ${paiements.modePaiement}",
                                  style: TextStyle(
                                    color: Color(0xFFEBEBEB),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 2),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
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
                  'Réf: ${package?.reference}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              //IMAGE LIVREUR
              // Container(
              //     padding: EdgeInsets.fromLTRB(15, 15, 30, 10),
              //     width: double.infinity,
              //     decoration: BoxDecoration(
              //       color: Color(0x00FFFFFF),
              //     ),
              //     child: Center(
              //         child: Image.asset(
              //       "assets/images/liv.png",
              //       height: 170,
              //     ))),
              SizedBox(height: 5),
              Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Color(0xFFFFFFFF),
                        blurRadius: 0,
                        offset: Offset(0, 2))
                  ], color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //DETAIL COLISAGE
                      Center(
                        child: Column(
                          children: [
                            SizedBox(height: 2.0),
                            Container(
                              height: 30,
                              child: Row(
                                children: [
                                  Container(
                                    height:
                                        41, // set the height of the container
                                    width: 41, // set the width of the container
                                    child:
                                        Image.asset('assets/images/sender.png'),
                                    padding: EdgeInsets.fromLTRB(12, 0, 5, 0),
                                  ),
                                  Text(
                                    // 'Expéditeur: Rajaonarison Antoine' ,
                                    // 'Expéditeur: ${package.expediteur}' ,
                                    'Expéditeur: ${package?.expediteur}',
                                    style: TextStyle(
                                        color: Color(0xFF797878),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 20,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 35.0),
                                    child: Text(
                                      ' ${package?.contactExpediteur}',
                                      style: TextStyle(
                                          color: Color(0xFF797878),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Container(
                              height: 30,
                              child: Row(
                                children: [
                                  Container(
                                    height:
                                        41, // set the height of the container
                                    width: 41, // set the width of the container
                                    child: Image.asset(
                                        'assets/images/recipient.png'),
                                    padding: EdgeInsets.fromLTRB(12, 0, 5, 0),
                                  ),
                                  Text(
                                    "Destinataire: ${package?.destinataire}", // Destinataire
                                    style: TextStyle(
                                        color: Color(0xFF797878),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 20,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 35.0),
                                    child: Text(
                                      ' ${package?.contactDestinataire}',
                                      style: TextStyle(
                                          color: Color(0xFF797878),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 9),
                      Container(
                        height: 30,
                        child: Row(
                          children: [
                            Container(
                              height: 41, // set the height of the container
                              width: 41, // set the width of the container
                              child: Image.asset('assets/images/recipient.png'),
                              padding: EdgeInsets.fromLTRB(12, 0, 5, 0),
                            ),
                            Text(
                              "Récupérateur: ${package?.recuperateur ?? ''}", // Destinataire
                              style: TextStyle(
                                color: Color(0xFF797878),
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 9),

                      //ETAT
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 15),
                        child: Column(
                          children: [
                            //LES 4 ETATS
                            //ETAT 1
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      color: expedition != null
                                          ? Color(0xFFEC6701)
                                          : Color(0xFF797878),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  SizedBox(width: 3),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "Départ: ${package?.lieuDepart} ${expedition != null ? '(' + expedition + ')' : ''} ",
                                      style: TextStyle(
                                        color: Color(0xFF797878),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 5),
                            //ETAT 2
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    height:
                                        15, // set the height of the container
                                    width: 15, // set the width of the container
                                    decoration: BoxDecoration(
                                      color: arrivee != null
                                          ? Color(0xFFEC6701)
                                          : Color(0xFF797878),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  SizedBox(width: 3),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      " Destination:  ${package?.lieuDestination}  ${arrivee != null ? '(' + arrivee + ')' : ''} ",
                                      style: TextStyle(
                                          color: Color(0xFF797878),
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
                                children: [
                                  Container(
                                    height:
                                        15, // set the height of the container
                                    width: 15, // set the width of the container
                                    decoration: BoxDecoration(
                                      color: livraison != null
                                          ? Color(0xFFEC6701)
                                          : Color(0xFF797878),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  SizedBox(width: 3),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 7.0),
                                    child: Text(
                                      "Livraison: ${livraison != null ? '(' + livraison + ')' : ''} ",
                                      style: TextStyle(
                                          color: Color(0xFF797878),
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
                      // // MONTANT ET RESTE A PAYER NE SONT AFFICHES QUE SI L'USER EST L'EXPEDITEUR
                      //TEST 3
                      Container(
                        child: Column(
                          children: [
                            (package?.expediteur_id == userId)
                                ? Container(
                                    height: 30,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 41,
                                          width: 41,
                                          child: Image.asset(
                                              'assets/images/price.png'),
                                          padding:
                                              EdgeInsets.fromLTRB(12, 0, 5, 0),
                                        ),
                                        Text(
                                          "Montant: ${package?.tarifEnvoiEUR}${package?.tarifExtraEUR != 0 ? " + ${package?.tarifExtraEUR} " : ""} €",
                                          style: TextStyle(
                                            color: Color(0xFF797878),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : SizedBox(),
                            SizedBox(height: 2.0),
                            package?.expediteur_id == userId
                                ? Container(
                                    height: 30,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 41,
                                          width: 41,
                                          child: Image.asset(
                                              'assets/images/price.png'),
                                          padding:
                                              EdgeInsets.fromLTRB(12, 0, 5, 0),
                                        ),
                                        Text(
                                          "Reste à payer: ${package?.resteAPayerEUR} €",
                                          style: TextStyle(
                                            color: Color(0xFF797878),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        height: 30,
                        child: Row(
                          children: [
                            Container(
                              height: 41, // set the height of the container
                              width: 41, // set the width of the container
                              child: Image.asset('assets/images/package.png'),
                              padding: EdgeInsets.fromLTRB(12, 0, 5, 0),
                            ),
                            Text(
                              'Nombre de colis: ${package?.nbreColis ?? 0}',
                              style: TextStyle(
                                  color: Color(0xFF797878),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: 10.0),
              if (isLoading)
                Positioned.fill(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      _showArticleList(context);
                    },
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 221, 100, 1),
                        ),
                        child: Center(
                          child: Text(
                            'Articles',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //La liste de paiements n'est visible que si l'user est expéditeur
              (package?.expediteur_id == userId)
                ? Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      _showPayment(context, package!);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(color: Color(0xFF032547)),
                      child: Center(
                        child: Text(
                          ' Paiements ',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              )  : SizedBox()
            ],
          ),
        ],
      ),
    );
  }
}
