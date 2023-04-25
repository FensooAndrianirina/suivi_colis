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
import 'package:fluttertoast/fluttertoast.dart';
import 'package:client_apk/routes.dart';


class ResetPassword extends StatefulWidget {
  @override
  _ResetPassword createState() => _ResetPassword();
}


class _ResetPassword extends State<ResetPassword> {

String _email="";

static bool isEmail(String value) {
    // Use a regular expression to check if value is a valid email address
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
  }

// void redirectionToLoginScreen() {
//     Navigator.push(
//         context, MaterialPageRoute(builder: (context) => LoginScreen()));
//   }


  //txt
  Widget buildText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
            "Entrez votre adresse mail pour recevoir l'email de réinitialisation de mot de passe",
            style: TextStyle(
            color: Color.fromARGB(255, 33, 66, 99),
            fontSize: 17,
            fontWeight: FontWeight.w600),
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
               if (formKey.currentState!.validate()) {
                  print("OK");
                }
                else {
                  print("NOT OK");
                }  
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
                          SizedBox(height: 160),
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
    );
  }
}
