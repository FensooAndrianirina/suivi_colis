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
import 'package:client_apk/routes.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:art_sweetalert/art_sweetalert.dart';








class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            'Bienvenue sur Madagroupage',
            style: TextStyle(
            color: Color.fromARGB(255, 16, 46, 76),
            fontSize: 29,
            fontWeight: FontWeight.w900),
          ),
        ),
         Container(
          child: Text(
            'Créez votre compte client',
            style: TextStyle(
            color: Color.fromARGB(255, 29, 61, 92),
            fontSize: 20,
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
      // icon: FaIcon(FontAwesomeIcons.facebook).icon,
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

  //TestInkwell
  Widget buildInk(){
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChangePassword()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          width: 200.0,
          height: 50.0,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(
              "Voir détails",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  

  //LISTE PAIEMENT
  Widget buildTable() {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:  DataTable(
          columns: [
            DataColumn(label: Text('Date')),
            DataColumn(label: Text('Type de paiement')),
            DataColumn(label: Text('Montant')),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('06/11/2022')),
              DataCell(Text('MM MVola: 034 96 000 20', softWrap: true)),
              DataCell(Text('400 000 Ariary ⇐⇒ 82,65 €', softWrap: true)),
            ]),
            DataRow(cells: [
              DataCell(Text('17/12/2022')),
              DataCell(Text('Virement bancaire (RIB: 0001 0001 0001 0001)', softWrap: true)),
              DataCell(Text('1 000 000 Ariary ⇐⇒ 206,65 €')),
            ]),
            DataRow(cells: [
              DataCell(Text('14/04/2023')),
              DataCell(Text('En espèces')),
              DataCell(Text('1 500 000 Ariary ⇐⇒ 309,92 €', softWrap: true)),
            ]),
          ],
        )
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
                      Container(
                          padding: EdgeInsets.all(15),
                          child: Center(
                              child: Image.asset("images/sbox.png", height: 90,
                                  )
                               ),       
                            ),
                      Container(
                        padding: EdgeInsets.fromLTRB(43, 5, 43, 0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              buildText(),
                              SizedBox(height:25),
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
                              buildSigninBtn(),
                              SizedBox(height:5),
                              buildBackToLogin()  ,
                              SizedBox(height:5),
                              buildInk(),
                              SizedBox(height:5),
                              buildTable()
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