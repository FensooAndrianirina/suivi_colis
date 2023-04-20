import 'package:client_apk/views/changePassword.dart';
import 'package:client_apk/views/listScreen.dart';
import 'package:client_apk/views/loginScreen.dart';
import 'package:client_apk/views/changePassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';




class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only( left: 9 , bottom: 5),
          child: Text(
              'Nom(s) et prénom(s) *',
              style: TextStyle(
                  color: Color(0xff295078),
                  fontSize: 11,
                  fontWeight: FontWeight.w900),
              ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(21),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 50,
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
                // setState(() {
                //   _nameError = formKey.currentState.validate()
                //       ? null
                //       : 'Please enter your name';
                // });
            },
            keyboardType: TextInputType.emailAddress,  
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.people,
                  color: Color(0xff295078),
                ),
                ),  
                validator: MultiValidator(
                [
                  RequiredValidator(errorText: "Ce champ ne peut pas être vide"),
                  MinLengthValidator(2, errorText: "Ce nom est trop court (minimum 2 caractères)"),
                  // PatternValidator(r'^[a-zA-Z\s]*$', errorText: 'Entrer un nom valide'), r'^\d\d\d\d\d\d\d\d\d\d$'
                ]
              ),       
          ),
        )
      ],
    );
  }


  //Tel
  Widget buildTel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
         Padding(
          padding: const EdgeInsets.only( left: 9 , bottom: 5),
          child: Text(
              'Téléphone *',
              style: TextStyle(
                  color: Color(0xff295078),
                  fontSize: 11,
                  fontWeight: FontWeight.w900),
              ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(21),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 50,
          child: TextFormField(
            onChanged: (value) => {},
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.phone,
                  color: Color(0xff295078),
                ),),  
                validator: MultiValidator([
                RequiredValidator(errorText: "Ce champ ne peut pas être vide"),
                PatternValidator( r'^\d\d\d\d\d\d\d\d\d\d$', errorText: 'Entrer un numéro de téléphone valide'),
            ]),       
          ),
        )
      ],
    );
  }


  //Email
  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
         Padding(
          padding: const EdgeInsets.only( left: 9 , bottom: 5),
          child: Text(
              'Email *',
              style: TextStyle(
                  color: Color(0xff295078),
                  fontSize: 11,
                  fontWeight: FontWeight.w900),
              ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(21),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 50,
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) => {},
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xff295078),
                ),),  
                  validator: (value) {    
                //   if(!GetUtils.isEmail(value!)) {
                //    return "Adresse mail invalide";
                //   } else {
                //   return null;
                // }
                if (!GetUtils.isEmail(value!)) {
                return "Adresse mail invalide";
                } else {
                return null;
              }
            },       
          ),
        )
      ],
    );
  }

  //Facebook
  Widget buildFb() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
         Padding(
          padding: const EdgeInsets.only( left: 9 , bottom: 5),
          child: Text(
              'Facebook (Optionnel)',
              style: TextStyle(
                  color: Color(0xff295078),
                  fontSize: 11,
                  fontWeight: FontWeight.w900),
              ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(21),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 50,
          child: TextFormField(
            onChanged: (value) => {},
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 15),
                prefixIcon : Padding(
                  padding: EdgeInsets.only(left: 8, top:6),
                  child: FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Color(0xff295078),
                  )
                )
               ),    
                validator: MultiValidator([
                RequiredValidator(errorText: "Ce champ ne peut pas être vide"),
                MinLengthValidator(3, errorText: "Ce pseudo Facebook est trop court (minimum 3 caractères)"),
            ]), 
          ),
        )
      ],
    );
  }
                

  //Address
  Widget buildAdd() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
         Padding(
          padding: const EdgeInsets.only( left: 9 , bottom: 5),
          child: Text(
              'Adresse *',
              style: TextStyle(
                  color: Color(0xff295078),
                  fontSize: 11,
                  fontWeight: FontWeight.w900),
              ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(21),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 50,
          child: TextFormField(
            onChanged: (value) => {},
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.maps_home_work,
                  color: Color(0xff295078),
                )),  
                validator: MultiValidator([
                RequiredValidator(errorText: "Ce champ ne peut pas être vide"),
                MinLengthValidator(10, errorText: "Cette adresse est trop courte"),
            ]),       
          ),
        )
      ],
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