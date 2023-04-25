import 'package:client_apk/views/signinScreen.dart';
import 'package:client_apk/views/listScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:client_apk/views/textField_component.dart';
import 'package:client_apk/routes.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:client_apk/services/change_password_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import '../config/const.dart';


class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  _ChangePassword createState() => _ChangePassword();
}

class _ChangePassword extends State<ChangePassword> {

  String _password="";
  String _newPassword="";
  String _confirmPassword="";
  bool _passwordVisible = false;
  bool _showOldPasswordError = false;

   void redirectionToListScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ListScreen()));
  }

  void showError(String title, String text){
    ArtSweetAlert.show(
      context: context,
      artDialogArgs: ArtDialogArgs(
        type: ArtSweetAlertType.danger,
        dialogDecoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)),
        text: text,
        title: title,
        confirmButtonText: "OK",
        confirmButtonColor: const Color(0xFF3E72A4)));
  }

  _changePassword() async {
    if (formKey.currentState!.validate()) {
      try {
        var rep = await ChangePasswordService()
            .changePassword(_password, _newPassword, _confirmPassword);
        if(rep == 200){
            ArtSweetAlert.show(
            context: context,
            artDialogArgs: ArtDialogArgs(
              type: ArtSweetAlertType.success,
              dialogDecoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)),
              text: "Changement de mot de passe effectué",
              // confirmButtonText: "OK",
              // confirmButtonColor: const Color(0xFF3E72A4)
            )
          );

          Future.delayed(Duration(seconds: 2), () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => ListScreen(),
              ),
            );
          });
        } 
        else{
          // redirectToChangePassword(context);
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => ChangePassword(),
            ),
          );
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

  late SharedPreferences prefs;

  void loginUser(String password, String newPassword, String confirmPassword) async {
    var api = Const.host + "/api/client/changePwd";
    final dio = new Dio();

    //API Input
    var data = 
    { 
      "password": password, 
      "newPassword": newPassword,
      "confirmPassword": confirmPassword
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
          prefs.setString('token', _descRetour);
          print("TONGA ETO");
          redirectionToListScreen();
        } else {
          throw _descRetour;
        }
      } else {
        throw "Erreur venant du serveur";
      }
    } catch (e) {
      print(e.toString());
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

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  //txt
  Widget buildText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Text(
            'Changement de mot de passe',
            style: TextStyle(
            color: Color(0xff295078),
            fontSize: 27,
            fontWeight: FontWeight.w900),
          ),
        )
      ],
    );
  }

  //OLD Password
  Widget buildOldPassword() {
   return InputWidget(
        onChanged: (value) => {_password = value},
        validator: (value) {
          if (value!.isEmpty) {
            return "Champ obligatoire";
          }

          if (!RegExp(r'^\d{4}$').hasMatch(value)) {
            return 'Le mot de passe doit contenir 4 chiffres';
          }
        },
        textInputType: TextInputType.number,
        visiblePassword: false,
        placeholder: 'Entrez votre ancien mot de passe',
        icon:  Icons.lock,
        max: 4
    );
  }

  //NEW Password
  Widget buildNewPassword() {
    return InputWidget(
        onChanged: (value) => {_newPassword = value},
        validator: (value) {
          if (value!.isEmpty) {
            return "Champ obligatoire";
          }

          if (!RegExp(r'^\d{4}$').hasMatch(value)) {
            return 'Le mot de passe doit contenir 4 chiffres';
          }
        },
        textInputType: TextInputType.number,
        visiblePassword: false,
        placeholder: 'Entrez votre nouveau mot de passe',
        icon:  Icons.lock,
        max: 4
    );
  }


  Widget buildConfirmPassword() {
    return InputWidget(
        onChanged: (value) => {_confirmPassword = value},
        validator: (value) {
          if (value!.isEmpty) {
            return "Champ obligatoire";
          }

          if (!RegExp(r'^\d{4}$').hasMatch(value)) {
            return 'Le mot de passe doit contenir 4 chiffres';
          }
        },
        textInputType: TextInputType.number,
        visiblePassword: false,
        placeholder: 'Confirmez le nouveau mot de passe',
        icon:  Icons.lock,
        max: 4
    );
  }

  //Save
  Widget buildSaveBtn(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        width: double.infinity,
        height: 100.0,
        child: Container(
          // color: Color.fromARGB(255, 120, 180, 9),
          padding: EdgeInsets.fromLTRB(75, 0, 75, 0),
          child: ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                if (_password == _newPassword) {
                  showError("Le nouveau mot de passe et l'ancien sont identiques", "");

                } else if (_newPassword != _confirmPassword){
                  showError("Veuillez confirmer le bon mot de passe", "");
                } 
                else {
                  _changePassword();              
                }
              }
            },
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23)),
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF103962)),
            child: Text(
              'Valider',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ));
  }

Future<void> _showPopupDialog(BuildContext context) async {
  showDialog(
    context: context,
    builder: (_) {
      bool isPopupClosed = false;
      return StatefulBuilder(
        builder: (context, setState) {
          if (isPopupClosed) {
            Navigator.of(context).pop();
          }
          return AlertDialog(
            backgroundColor: Color(0xFF032547),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: EdgeInsets.all(23),
            titlePadding: EdgeInsets.fromLTRB(16, 16, 0, 0),
            contentTextStyle: TextStyle(
              color: Color(0xFF032547),
              fontSize: 17,
            ),
            titleTextStyle: TextStyle(
              color: Color(0xFF032547),
              fontSize: 20,
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 8, right: 11),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 1),
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('images/logout.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Déconnexion ?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Souhaitez-vous vraiment vous déconnecter ?',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Do something on 'Oui' button press
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFFD4833B)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      child: Text('Oui'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFFD4833B)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      child: Text('Non'),
                    ),
                  ],
                ),
              ],
            ),
            actions: [],
          );
        },
      );
    },
  );
}




GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SigninScreen()),
            );
          },
        ),
        backgroundColor: Color(0xFF032547),
        actions: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 1, 15, 0),
            child:   IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            // onPressed: () {
            //     prefs.remove('token');
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => LoginScreen()),
            //     );

            //   },
              onPressed: () {
                _showPopupDialog(context);
              },
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
                color: Colors.white,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                          SizedBox(height: 40),
                           Container(
                          padding: EdgeInsets.all(15),
                          child: Center(
                              child: Image.asset("images/padlock.png", height: 120
                                  )
                               ),       
                            ),
                          SizedBox(height: 40),
                          Container(
                            padding: EdgeInsets.fromLTRB(43, 5, 43, 0),
                            child: Form(
                              key: formKey,
                                child: Column(
                                  children: [
                                  buildText(),
                                  SizedBox(height:50),
                                  buildOldPassword(),
                                  SizedBox(height:15),
                                  buildNewPassword(),
                                  SizedBox(height:15),
                                  buildConfirmPassword(),
                                  SizedBox(height: 15),         
                                  buildSaveBtn(context),
                            ],
                          ),
                        )
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
