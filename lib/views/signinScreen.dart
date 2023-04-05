import 'package:client_apk/views/listScreen.dart';
import 'package:client_apk/views/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        child: Text(
            'Nom et prénom *',
            style: TextStyle(
            color: Color.fromARGB(255, 16, 46, 76),
            fontSize: 13,
            fontWeight: FontWeight.w900),
          ),
        ),
        SizedBox(height: 4),
        Container(
          padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(21),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 50,
        ),
      ],
    );
  }


  //Email
  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        child: Text(
            'Email *',
            style: TextStyle(
            color: Color.fromARGB(255, 16, 46, 76),
            fontSize: 13,
            fontWeight: FontWeight.w900),
          ),
        ),
        SizedBox(height: 4),
        Container(
          padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(21),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 50,
        ),
      ],
    );
  }


  //Tel
  Widget buildTel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        child: Text(
            'Téléphone *',
            style: TextStyle(
            color: Color.fromARGB(255, 16, 46, 76),
            fontSize: 13,
            fontWeight: FontWeight.w900),
          ),
        ),
        SizedBox(height: 4),
        Container(
          padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(21),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 50,
        ),
      ],
    );
  }

  //Facebook
  Widget buildFb() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        child: Text(
            'Facebook (Optionnel)',
            style: TextStyle(
            color: Color.fromARGB(255, 16, 46, 76),
            fontSize: 13,
            fontWeight: FontWeight.w900),
          ),
        ),
        SizedBox(height: 4),
        Container(
          padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(21),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 50,
        ),
      ],
    );
  }

  //Address
  Widget buildAdd() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        child: Text(
            'Adresse*',
            style: TextStyle(
            color: Color.fromARGB(255, 16, 46, 76),
            fontSize: 13,
            fontWeight: FontWeight.w900),
          ),
        ),
        SizedBox(height: 4),
        Container(
          padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(21),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 50,
        ),
      ],
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
              //loginUser(_userEmail,_userPassword);
              // redirectionToListScreen();
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
                        child: Column(
                          children: [
                            buildText(),
                            SizedBox(height:25),
                            buildName(),
                            SizedBox(height: 10),
                            buildEmail(),
                            SizedBox(height: 10),
                            buildTel(),
                            SizedBox(height: 10),
                            buildFb(),
                            SizedBox(height: 10),
                            buildAdd(),
                            SizedBox(height: 15),
                            buildSigninBtn(),
                            SizedBox(height:5),
                            buildBackToLogin()  
                          ],
                        ),
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