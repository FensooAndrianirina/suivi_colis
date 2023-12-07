import 'package:client_apk/views/changePassword.dart';
import 'package:client_apk/views/listScreen.dart';
import 'package:client_apk/views/loginScreen.dart';
import 'package:client_apk/views/changePassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:client_apk/views/textField_component.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:client_apk/routes.dart';


class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String _name = ""; 
  String _email = ""; 
  String _tel = ""; 
  String _fb = ""; 
  String _address = ""; 


  static bool isName(String value){
      //at least at least 4 letters, with at least one uppercase and one lowercase:
      return RegExp(r'^(?=.*[a-z])(?=.*[A-Z])[a-zA-Z0-9]{4,}$').hasMatch(value);

  }

  static bool isEmail(String value) {
    // Use a regular expression to check if value is a valid email address
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
  }

  bool isPhoneNumber(String value) {
    // Use a regular expression to check if value is a 10-digit phone number
    return RegExp(r'^\d{10}$').hasMatch(value);
  }

   static bool isFb(String value){
      //at least 2 letters
      return RegExp(r'[a-zA-Z].*[a-zA-Z]').hasMatch(value);

  }

   static bool isAddress(String value){
      //at least 5 letters
      return RegExp(r'[a-zA-Z].*[a-zA-Z].*[a-zA-Z].*[a-zA-Z].*[a-zA-Z]').hasMatch(value);

  }


 //txt
  Widget buildText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Text(
            'Compte client',
            style: TextStyle(
            color: Color.fromARGB(255, 16, 46, 76),
            fontSize: 29,
            fontWeight: FontWeight.w900),
          ),
        ),
         Container(
          child: Text(
            'Modifier le profil',
            style: TextStyle(
            color: Color.fromARGB(255, 17, 38, 59),
            fontSize: 18,
            fontWeight: FontWeight.w800),
          ),
        )
      ],
    );
  }

  //Name
  Widget buildName() {
    return InputWidget(
      onChanged: (value) => {_name = value},
      validator: (value) {
         if (value == null || value.isEmpty) {
            return 'Veuillez saisir votre nom et prénom';
          }
          if (!isName(value)) {
            return 'Ce champ doit contenir au moins une majuscule et une minuscule(4 lettres minimum)';
          }
          return null;
      },
      textInputType: TextInputType.text,
      visiblePassword: false,
      placeholder: "Nom et prénom (Obligatoire)",
      icon: Icons.people,
      max: 50,
    );
  }


  //Tel
  Widget buildTel() {
    return InputWidget(
        onChanged: (value) => {_tel = value},
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Veuillez saisir votre numéro de téléphone';
          }
          if (!isPhoneNumber(value)) {
            return 'Entrez un numéro de téléphone valide';
          }
          return null;
        },
        textInputType: TextInputType.text,
      visiblePassword: false,
      placeholder: 'Entrez votre numéro de téléphone (Obligatoire)',
      icon:  Icons.phone,
      max: 10
    );
  }


  //Email
  Widget buildEmail() {
     return InputWidget(
        onChanged: (value) => {_email = value},
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Veuillez saisir votre adresse mail';
          }
          if (!isEmail(value)) {
            return 'Entrez une adresse mail';
          }
          return null;
        },
        textInputType: TextInputType.text,
      visiblePassword: false,
      placeholder: 'Entrez votra adresse mail (Optionnel)',
      icon:  Icons.email,
      max: 80
    );
  }

  //Facebook
  Widget buildFb() {
     return InputWidget(
        onChanged: (value) => {_fb = value},
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Veuillez saisir votre pseudo Facebook';
          }
          if (!isFb(value)) {
            return 'Entrez votre pseudo Facebook';
          }
          return null;
        },
        textInputType: TextInputType.text,
      visiblePassword: false,
      placeholder: 'Entrez votre pseudo Facebook',
      icon: Icons.facebook,
      max: 25
    );
  }
                

  //Address
  Widget buildAdd() {
     return InputWidget(
        onChanged: (value) => {_address = value},
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Veuillez saisir votre adresse';
          }
          if (!isAddress(value)) {
            return "L'adresse doit contenir au moins 5 lettres";
          }
          return null;
        },
        textInputType: TextInputType.text,
      visiblePassword: false,
      placeholder: 'Entrez votre adresse (Optionnel)',
      icon:  Icons.maps_home_work,
      max: 80
    );
  }

  //SaveBtn
  Widget buildSaveBtn() {
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
                }
                else {
                }
            },
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23)),
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF103962)),
            child: Text(
              "Sauvegarder les modifications",
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.fromLTRB(15, 40, 15, 15),
                          child: Center(
                              child: Image.asset("images/profile.png", height: 80,
                                  )
                               ),       
                            ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.fromLTRB(43, 5, 43, 0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              buildText(),
                              SizedBox(height:40),
                              buildName(),
                              SizedBox(height: 10),
                              buildTel(),
                              SizedBox(height: 10),
                              buildEmail(),
                              SizedBox(height: 10),
                              buildFb(),
                              SizedBox(height: 10),
                              buildAdd(),
                              SizedBox(height: 15),
                              buildSaveBtn(),
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