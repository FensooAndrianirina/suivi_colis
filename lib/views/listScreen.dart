import 'package:client_apk/views/changePassword.dart';
import 'package:client_apk/views/changeProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:client_apk/views/detailScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:client_apk/views/loginScreen.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:client_apk/services/package_list_service.dart';
import 'package:client_apk/models/package_model.dart';
import 'package:intl/intl.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  _ListScreen createState() => _ListScreen();
}

class _ListScreen extends State<ListScreen> {
  late SharedPreferences prefs;
  List<PackageModel> packages = [];

  @override
  void initState() {
    super.initState();
    print('ATO AM INIT');
    //get List colis from api
    _packageList();
    initPrefs();
  }

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  _packageList() async {
    try {
      List<PackageModel> rep = await PackageListService().packageList();
      print('REP');
      print(rep);
      if (rep != null) {
        print('Package list fetched successfully');

        setState(() {
          packages =
              rep; // Assuming the API response returns a list of packages
        });
      } else {
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
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              title: "Erreur",
              text: exception.toString(),
              confirmButtonText: "OK",
              confirmButtonColor: const Color(0xFF3E72A4)));
    }
  }

  void showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Déconnexion',
            style: TextStyle(color: Color(0xFFDA6D14)),
          ),
          content: Text(
            'Êtes-vous sûr de vouloir vous déconnecter ?',
            style: TextStyle(
              color: Color.fromARGB(255, 28, 53, 78),
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            TextButton(
                onPressed: () async {
                  Navigator.of(context).pop(); // Dismiss the dialog
                  // Perform logout logic
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.remove('token');
                  if (context.mounted) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }
                },
                child: Text(
                  'Oui',
                  style: TextStyle(color: Color(0xFFDA6D14)),
                )),
            TextButton(
                onPressed: () {
                  print('CANCEL');

                  Navigator.of(context).pop(); // Dismiss the dialog
                },
                child: Text(
                  'Non',
                  style: TextStyle(color: Color(0xFFDA6D14)),
                )),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF032547),
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(children: [
            Text(
              'Liste de colisage: ',
              style: TextStyle(
                  fontWeight: FontWeight.w500, color: Color(0xFFFFF9F4)),
            ),
            Text(
              '${packages.length}',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 230, 111, 13)),
            ),
          ]),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: PopupMenuButton(
              offset: const Offset(0, kToolbarHeight + 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  value: "profile",
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(
                          Icons.person,
                          color: Color(0xFF295078),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Text("Mon profil"),
                        ),
                      ],
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: "changePass",
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(
                          Icons.lock,
                          color: Color(0xFF295078),
                        ),
                        Text("Mot de passe"),
                      ],
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: "deconnexion",
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.logout,
                          color: Color(0xFF295078),
                        ),
                        Text("Déconnexion"),
                      ],
                    ),
                  ),
                )
              ],
              onSelected: (String value) {
                if (value == "deconnexion") {
                  showLogoutConfirmation(context);
                } else if (value == "profile") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChangeProfile()));
                } else if (value == "changePass") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangePassword()));
                }
              },
            ),
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          // Handle back button press
          // Implement your desired behavior here
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Confirmation'),
                content: Text('Êtes-vous sûr de vouloir vous déconnecter ?'),
                actions: [
                  TextButton(
                    onPressed: () async {
                      Navigator.of(context).pop(); // Dismiss the dialog
                      // Perform logout logic
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.remove('token');
                      if (context.mounted) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      }
                    },
                    child: Text('Oui'),
                  ),
                  TextButton(
                    onPressed: () {
                      print('CANCEL');

                      Navigator.of(context).pop(); // Dismiss the dialog
                    },
                    child: Text('Non'),
                  ),
                ],
              );
            },
          );
          return false; // Return true to allow the back navigation, or false to prevent it
        },
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Color.fromARGB(255, 251, 242, 238),
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 30.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 3),
                        ListView.builder(
                          shrinkWrap: true, // Added shrinkWrap property
                          physics:
                              NeverScrollableScrollPhysics(), // Added physics property
                          itemCount: packages.length,
                          itemBuilder: (context, index) {
                            var package = packages[index];
                            var montant = (package.tarifEnvoiEUR ?? 0.0) +
                                (package.tarifExtraEUR ?? 0.0);
                            var formattedDate = DateFormat('dd/MM/yyyy')
                                .format(package.dateEnvoi);
                            return GestureDetector(
                              onTap: () {
                                print('ON TAP START');
                                // Navigate to the desired screen when the container is tapped
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(),
                                  ),
                                );
                                print('ON TAP END');
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors
                                        .white, // Set the background color to white
                                    borderRadius: BorderRadius.circular(
                                        10), // Set the border radius to 10
                                  ),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        //COLIS 1
                                        Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 10, 10, 17),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color(0xFF295078),
                                                      blurRadius: 6,
                                                      offset: Offset(0, 2))
                                                ],
                                                color: Colors.white),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      //EXPANDED 1
                                                      Expanded(
                                                        child: Container(
                                                          height: 30,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                height:
                                                                    41, // set the height of the container
                                                                width:
                                                                    41, // set the width of the container
                                                                child: Image.asset(
                                                                    'assets/images/desc.png'),
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            12,
                                                                            0,
                                                                            5,
                                                                            0),
                                                              ),
                                                              Text(
                                                                'Référence: ',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                              ),
                                                              Text(
                                                                '${package.reference}',
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xFF797878),
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 2.0),
                                                      // Expanded(
                                                      //   child: Container(
                                                      //     height: 30,
                                                      //     child: Padding(
                                                      //       padding:
                                                      //           const EdgeInsets
                                                      //               .all(3.0),
                                                      //       child: Icon(
                                                      //         Icons
                                                      //             .arrow_forward,
                                                      //         color: Color
                                                      //             .fromARGB(
                                                      //                 0,
                                                      //                 255,
                                                      //                 153,
                                                      //                 0),
                                                      //       ),
                                                      //     ),
                                                      //   ),
                                                      // ),
                                                      //EXPANDED 2
                                                      Expanded(
                                                        child: Container(
                                                          height: 30,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                height:
                                                                    41, // set the height of the container
                                                                width:
                                                                    41, // set the width of the container
                                                                child: Image.asset(
                                                                    'assets/images/etat.png'),
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            11,
                                                                            0,
                                                                            5,
                                                                            0),
                                                              ),
                                                              Text(
                                                                "Envoi: ",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                              ),
                                                              Text(
                                                                // '${package.dateEnvoi}',
                                                                '${formattedDate}',
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xFF797878),
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 5),
                                                //EXPEDIEUR ET DESTINATAIRE
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      //EXPANDED 1
                                                      Expanded(
                                                        child: Container(
                                                          height: 30,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                height:
                                                                    42, // set the height of the container
                                                                width:
                                                                    42, // set the width of the container
                                                                child: Image.asset(
                                                                    'assets/images/sender.png'),
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            12,
                                                                            0,
                                                                            5,
                                                                            0),
                                                              ),
                                                              Text(
                                                                'Expéditeur: ',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                              ),
                                                              Text(
                                                                '${package.expediteur}',
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xFF797878),
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 2.0),
                                                      //EXPANDED 2
                                                      Expanded(
                                                        child: Container(
                                                          height: 30,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                height:
                                                                    42, // set the height of the container
                                                                width:
                                                                    42, // set the width of the container
                                                                child: Image.asset(
                                                                    'assets/images/recipient.png'),
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            12,
                                                                            0,
                                                                            5,
                                                                            0),
                                                              ),
                                                              Text(
                                                                'Destinataire: ',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                              ),
                                                              Text(
                                                                '${package.destinataire}',
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xFF797878),
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
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
                                      ]),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
