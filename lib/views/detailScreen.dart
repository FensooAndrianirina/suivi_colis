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
              padding: EdgeInsets.fromLTRB(10, 10, 10, 17),
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
                  //REF
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
                          'Référence: ',
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
                  //DESCRIPTION
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
                          "Date d'envoi: ",
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
                  //ETAT
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
                          'Nombre de colis: ',
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

                  //EXPEDITEUR
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
                          'Expéditeur: ',
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

                  //DESTINATAIRE
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
                          'Destinataire: ',
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

                  //MONTANT
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
                          'Montant: ',
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
                  //REF
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
                          'Référence: ',
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
                  //DESCRIPTION
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
                          "Date d'envoi: ",
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
                  //ETAT
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
                          'Nombre de colis: ',
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

                  //EXPEDITEUR
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
                          'Expéditeur: ',
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

                  //DESTINATAIRE
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
                          'Destinataire: ',
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

                  //MONTANT
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
                          'Montant: ',
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
              )),


              //DRAGGABLE SCROLLABLE SHEET
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.zero,
                      // color: Color(0xFF493B3B),
                    ),
                    width: double.infinity,
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFDE7410)),
                          ),
                        child: Text('Mes colis/articles'),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return DraggableScrollableSheet(
                                initialChildSize: 0.5,
                                minChildSize: 0.1,
                                maxChildSize: 0.9,
                                builder: (BuildContext context,
                                  ScrollController scrollController) {
                                  return Container(
                                    color: Color(0xFFE25656),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height:
                                              41, // set the height of the container
                                          width: 41, // set the width of the container
                                          child:
                                              Image.asset('assets/images/desc.png'),
                                          padding: EdgeInsets.fromLTRB(12, 0, 5, 0),
                                        ),
                                        Text(
                                          'Référence: ',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          'FR_17052023_000',
                                          style: TextStyle(
                                              color: Color(0xFF797878),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                
                  Container(
                    height: screenHeight * 0.1, // Adjust the height as needed
                    width: double.infinity,
                    child: SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Color(0xFF032547)),
                        ),
                        child: Text('Liste de paiements'),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return DraggableScrollableSheet(
                                initialChildSize: 0.5,
                                minChildSize: 0.1,
                                maxChildSize: 0.9,
                                builder: (BuildContext context,
                                    ScrollController scrollController) {
                                  return Container(
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 224, 227, 230),
                                      borderRadius: BorderRadius.zero,
                                    ),
                                    child: ListView.builder(
                                      controller: scrollController,
                                      itemCount: 30,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return ListTile(
                                          title: Text('Second Sheet Item $index'),
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }
    }
