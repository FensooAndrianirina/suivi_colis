// ignore_for_file: unnecessary_new

import 'package:client_apk/views/changePassword.dart';
import 'package:client_apk/views/listScreen.dart';
import 'package:client_apk/views/loginScreen.dart';
import 'package:client_apk/views/changePassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../config/const.dart';
import 'package:client_apk/views/textField_component.dart';
import 'package:client_apk/routes.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:client_apk/services/signin_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  String _nom = "";
  String _email = "";
  String _telephone = "";
  String _contact = "";
  String _facebook = "";
  String _whatsapp = "";
  String _adresse = "";

  _signin() async {
    if (formKey.currentState!.validate()) {
      try {
        var rep = await SigninService().signin(
            _nom, _email, _telephone, _adresse, _facebook, _whatsapp, _contact);
        if (rep == 200 || rep == 202) {
          if (context.mounted) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          }
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
  }

  // static bool isName(String value){
  //     //at least at least 2 letters, with at least one uppercase and one lowercase:
  //     return RegExp(r'^(?=.*[a-zA-Z].*[a-zA-Z])(?=.*[A-Z])(?=.*[a-z]).{4,}$').hasMatch(value);
  // }

  // static bool isName(String value) {
  //   //at least at least 2 letters, starts with an uppercase
  //   return RegExp(r'^(?=.*[a-zA-Z].*[a-zA-Z])(?=.*[A-Z])(?=.*[a-z])^[A-Z].{2,}$').hasMatch(value);
  // }

  static bool isName(String value) {
    //at least two letters that starts with an uppercase letter
    return RegExp(r'^(?=.*[a-zA-Z].*[a-zA-Z])(?=.*[A-Z])^[A-Z].*$')
        .hasMatch(value);
  }

  static bool isEmail(String value) {
    // Use a regular expression to check if value is a valid email address
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
  }

  // static bool isContact(String value) {
  //   // can contains 3 groups of ten numbers obligatorily separated by a space or comma followed by space if and only if there are more 10 numbers
  //   // if only 10 numbers => no comma / no space
  //   // if 2 or 3 groups of ten numbers => there must be a comma between every ten numbers, a comma or a comma followed by a space
  //   return RegExp(r'^0\d{9}(?:,[ ]?0\d{9}){0,2}$|^0\d{9},[ ]?0\d{9}$|^0\d{9}$').hasMatch(value);
  // }

  static bool isContact(String value) {
    // Contains 10 - 15 and can start with +
    return RegExp(r'^\+?\d{10,15}$').hasMatch(value);
  }

  static bool isPhoneNumber(String value) {
    return RegExp(r'^\+?\d{10,15}$').hasMatch(value);
  }

  static bool isFb(String value) {
    //at least 2 letters
    return RegExp(r'[a-zA-Z].*[a-zA-Z]').hasMatch(value);
  }

  static bool isWhats(String value) {
    return RegExp(r'^\+?\d{10,15}$').hasMatch(value);
  }

  static bool isAddress(String value) {
    //at least 5 letters
    return RegExp(r'[a-zA-Z].*[a-zA-Z].*[a-zA-Z].*[a-zA-Z].*[a-zA-Z]')
        .hasMatch(value);
  }

  void redirectionToLoginScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  void signinUser(String nom, String email, String telephone, String adresse,
      String facebook, String whatsapp, String contact) async {
    var api = Const.host + "/api-client/register";
    final dio = new Dio();

    //API Input
    var data = {
      "nom": nom,
      "email": email,
      "telephone": telephone,
      "adresse": adresse,
      "facebook": facebook,
      "whatsapp": whatsapp,
      "contact": contact
    };

    Response? response = null;
    var body = null;

    try {
      response = await dio.post(api, data: data);
      if (response != null) {
        Map<String, dynamic> responseMap = response.data;
        int _codeRetour = responseMap["codeRetour"];
        String _descRetour = responseMap["descRetour"];

        if (_codeRetour == 200) {
          //Saving user information inside SharedPref
          redirectionToLoginScreen();
        } else {
          throw _descRetour;
        }
      } else {
        throw "Erreur venant du serveur";
      }
    } catch (e) {
      // print(e.toString());
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
      );
    }
    //
  }

  //txt
  Widget buildText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 55, bottom: 10),
              child: Builder(builder: (context) {
                return Center(
                  child: Text(
                    'Bienvenue sur Madagroupage',
                    style: TextStyle(
                        color: Color(0xFF102E4C),
                        fontSize: 29,
                        fontWeight: FontWeight.w900),
                  ),
                );
              }),
            ),
          ),
        ),
        Container(
          child: Center(
            child: Text(
              'Créez votre compte client',
              style: TextStyle(
                  color: Color.fromARGB(255, 29, 61, 92),
                  fontSize: 20,
                  fontWeight: FontWeight.w800),
            ),
          ),
        )
      ],
    );
  }

  //Name
  Widget buildName() {
    return InputWidget(
      onChanged: (value) => {_nom = value},
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Entrez votre nom et prénom';
        } else {
          if (value.length >= 2) {
            if (!isName(value)) {
              return 'Ce champ doit commencer par une majuscule';
            }
          } else {
            return 'Ce champ doit contenir au moins 2 lettres';
          }
        }
      },
      textInputType: TextInputType.text,
      visiblePassword: false,
      placeholder: "Nom(s) et prénom(s)*",
      icon: Icons.people,
      max: 100,
    );
  }

  //Email
  Widget buildEmail() {
    return InputWidget(
      onChanged: (value) => {_email = value},
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Entrez votre adresse mail';
        }
        if (!isEmail(value)) {
          return 'Entrez une adresse mail valide';
        }
        return null;
      },
      textInputType: TextInputType.text,
      visiblePassword: false,
      placeholder: 'Adresse email*',
      icon: Icons.email,
      max: 100,
    );
  }

  //Tel
  Widget buildTel() {
    return InputWidget(
      onChanged: (value) => {_telephone = value},
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Entrez votre numéro de téléphone';
        }

        if (!isPhoneNumber(value)) {
          return 'Entrez un numéro de téléphone valide';
        }
        return null;
      },
      textInputType: TextInputType.text,
      visiblePassword: false,
      placeholder: 'Numéro de téléphone*',
      icon: Icons.phone_enabled_rounded,
      max: 15,
    );
  }

  //Contact Tel
  Widget buildContactTel() {
    return InputWidget(
      onChanged: (value) => {_contact = value},
      validator: (value) {
        if (value == null || value.isEmpty) {
          return null;
        }
        if (!isContact(value)) {
          return 'Entrez un numéro de téléphone valide';
        }
        return null;
      },
      textInputType: TextInputType.text,
      visiblePassword: false,
      placeholder: 'Autre numéro de téléphone',
      icon: Icons.phone_enabled_rounded,
      max: 15,
    );
  }

  //Facebook
  Widget buildFb() {
    return InputWidget(
      onChanged: (value) => {_facebook = value},
      validator: (value) {
        if (value == null || value.isEmpty) {
          return null;
        }
        if (!isFb(value)) {
          return 'Entrez votre pseudo Facebook';
        }
        return null;
      },
      textInputType: TextInputType.text,
      visiblePassword: false,
      placeholder: 'Pseudo Facebook',
      icon: Icons.facebook,
      max: 100,
    );
  }

  Widget buildWhatsApp() {
    return InputWidget(
      onChanged: (value) => {_whatsapp = value},
      validator: (value) {
        if (value == null || value.isEmpty) {
          return null;
        }
        if (!isWhats(value)) {
          return 'Entrez votre numéro WhatsApp';
        }
        return null;
      },
      textInputType: TextInputType.text,
      visiblePassword: false,
      placeholder: 'Numéro WhatsApp',
      icon: Icons.add_ic_call_rounded,
      max: 15,
    );
  }

  Widget buildAdd() {
    return InputWidget(
      onChanged: (value) => {_adresse = value},
      validator: (value) {
        if (value == null || value.isEmpty) {
          return null;
        }
        if (!isAddress(value)) {
          return "L'adresse est trop courte";
        }
        return null;
      },
      textInputType: TextInputType.text,
      visiblePassword: false,
      placeholder: 'Adresse',
      icon: Icons.maps_home_work_rounded,
      max: 100,
    );
  }

  //SigninBtn
  Widget buildSigninBtn() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        width: double.infinity,
        height: 100.0,
        child: Container(
          // color: Color.fromARGB(255, 120, 180, 9),
          padding: EdgeInsets.fromLTRB(75, 0, 75, 0),
          child: ElevatedButton(
            onPressed: () {
              _signin();
            },
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23)),
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF103962)),
            child: Text(
              "S'inscrire",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ));
  }

  Widget buildBackToLogin() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: 'Vous avez déjà un compte?',
              style: TextStyle(
                  color: Color(0xFF1E354B),
                  fontSize: 13,
                  fontWeight: FontWeight.w600)),
          TextSpan(
              text: ' Connectez-vous',
              style: TextStyle(
                  color: Color(0xFF1E354B),
                  fontSize: 12,
                  fontWeight: FontWeight.w700))
        ]),
      ),
    );
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          // Handle back button press
          // Implement your desired behavior here
          if (context.mounted) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginScreen()));
          } // Exit the application
          return true; // Return true to allow the back navigation, or false to prevent it
        },
        child: AnnotatedRegion<SystemUiOverlayStyle>(
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
                        Container(
                          padding: EdgeInsets.only(top: 30),
                          child: Center(
                              child: Image.asset(
                            "assets/images/sbox.png",
                            height: 80,
                          )),
                        ),
                        Container(
                            padding: EdgeInsets.fromLTRB(43, 5, 43, 0),
                            child: Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  buildText(),
                                  SizedBox(height: 7),
                                  buildName(),
                                  SizedBox(height: 8),
                                  buildEmail(),
                                  SizedBox(height: 8),
                                  buildTel(),
                                  SizedBox(height: 8),
                                  buildContactTel(),
                                  SizedBox(height: 8),
                                  buildFb(),
                                  SizedBox(height: 8),
                                  buildWhatsApp(),
                                  SizedBox(height: 8),
                                  buildAdd(),
                                  SizedBox(height: 3),
                                  buildSigninBtn(),
                                  SizedBox(height: 3),
                                  buildBackToLogin(),
                                  SizedBox(height: 8),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
