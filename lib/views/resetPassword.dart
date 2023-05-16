import 'package:client_apk/views/signinScreen.dart';
import 'package:client_apk/views/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:client_apk/views/textField_component.dart';
import 'package:client_apk/routes.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:client_apk/routes.dart';
import 'package:client_apk/services/reset_password_service.dart';
import '../config/const.dart';
import 'package:dio/dio.dart';




class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

String _email="";

static bool isEmail(String value) {
    // Use a regular expression to check if value is a valid email address
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
}

void redirectionToLoginScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
}



  _resetPassword() async {
    if (formKey.currentState!.validate()) {
      try {
        var rep = await ResetPasswordService()
        .resetPassword(_email);
        if(rep == 200){    
          if (context.mounted) {  
             Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
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


  void UserEmail(String email) async {
    var api = Const.host + "/api-client/reset-pwd";
    final dio = new Dio();

    //API Input
    var data = { "email": email };

    Response? response = null;
    var body = null;

    try {
      response = await dio.post(api, data: data);
      if (response != null) {
        Map<String, dynamic> responseMap = response.data;
        int _codeRetour = responseMap["codeRetour"];
        String _descRetour = responseMap["descRetour"];

        if (_codeRetour == 200) {
          redirectionToLoginScreen();
        } else {
          throw _descRetour;
        }
      } else {
        throw "Erreur venant du serveur";
      }
    } catch (e) {
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
          Text(
            'Mot de passe oublié',
            style: TextStyle(
            color: Color(0xff295078),
            fontSize: 27,
            fontWeight: FontWeight.w900),
          ),
          SizedBox(height: 15),
          Text(
            "Recevez l'email de réinitialisation",
            style: TextStyle(
            color: Color.fromARGB(255, 21, 43, 65),
            fontSize: 15,
            fontWeight: FontWeight.w700),
        ),
         Text(
            "de votre mot de passe",
            style: TextStyle(
            color: Color.fromARGB(255, 21, 43, 65),
            fontSize: 15,
            fontWeight: FontWeight.w700),
        )
      ],
    );   
  }

  Widget buildEmail() {
    return InputWidget(
        onChanged: (value) => {_email = value},
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Veuillez saisir votre adresse mail';
          }
          if (!isEmail(value)) {
            return 'Entrez une adresse mail valide';
          }
          return null;
        },
        textInputType: TextInputType.emailAddress,
        visiblePassword: false,
        placeholder: 'exemple@exemple.com',
        icon:  Icons.email,
        max: 80
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
              _resetPassword(); 
            },
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23)),
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF103962)),
            child: Text(
              'Envoyer',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ));
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
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
        ),
        backgroundColor: Color(0xFF032547),
      ),
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
                          SizedBox(height: 20),
                          Container(
                          padding: EdgeInsets.fromLTRB(15, 40, 15, 15),
                          child: Center(
                              child: Image.asset("assets/images/cadenas.png", height: 190,
                                  )
                               ),       
                          ),
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.fromLTRB(43, 5, 43, 0),
                            child: Form(
                              key: formKey,
                                child: Column(
                                  children: [
                                  buildText(),
                                  SizedBox(height:33),
                                  buildEmail(),
                                  SizedBox(height:15),       
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
      )
    );
  }
}
