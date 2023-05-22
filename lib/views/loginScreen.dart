import 'package:client_apk/routes.dart';
import 'package:client_apk/views/aboutScreen.dart';
import 'package:client_apk/views/changePassword.dart';
import 'package:client_apk/views/listScreen.dart';
import 'package:client_apk/views/changeProfile.dart';
import 'package:client_apk/services/login_service.dart';
import 'package:client_apk/views/resetPassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:client_apk/views/detailScreen.dart';
import 'package:client_apk/views/signinScreen.dart';
import 'package:client_apk/views/textField_component.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../config/const.dart';
import '../interceptors/logging_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:art_sweetalert/art_sweetalert.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String _emailOrPhone = "";
  String _userPassword = "";

  _login() async {
    if (formKey.currentState!.validate()) {
      try {
        var rep = await LoginService()
            .login(_emailOrPhone, _userPassword);
        if(rep == 200){
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ListScreen()));
        }
        }else if(rep == 202){
          if (context.mounted){
             Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePassword(data: "login")));
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

  static bool isEmail(String value) {
    // Use a regular expression to check if value is a valid email address
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
  }

  bool isPhoneNumber(String value) {
    // Use a regular expression to check if value is a 10-digit phone number
    return RegExp(r'^\d{10}$').hasMatch(value);
  }

  void redirectionToListScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ListScreen()));
  }

  late SharedPreferences prefs;

  void loginUser(String email, String password) async {
    var api = Const.host + "/api-client/login";
    final dio = new Dio();

    //API Input
    var data = {"email": email, "password": password};

    Response? response = null;
    var body = null;

    try {
      response = await dio.post(api, data: data);
      if (response != null) {
        Map<String, dynamic> responseMap = response.data;

        int _codeRetour = responseMap["codeRetour"];
        String _descRetour = responseMap["descRetour"];

        print("DESCRIPTION RETOUR");
        if (_codeRetour == 200 || _codeRetour == 202 ) {
          //Saving user information inside SharedPref
          SharedPreferences prefs = await SharedPreferences.getInstance(); 
          
          prefs.setString('token', "test");
  
          print('OHATRAAAA');
        
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
            'Mon colis',
            style: TextStyle(
                color: Color(0xff295078),
                fontSize: 35,
                fontWeight: FontWeight.w900),
          ),
        )
      ],
    );
  }

  Widget buildEmail() {
    return InputWidget(
        onChanged: (value) => {_emailOrPhone = value},
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Entrez votre adresse email ou votre téléphone';
          }
          if (!isEmail(value) && !isPhoneNumber(value)) {
            return 'Entrez une adresse mail ou téléphone valide';
          }
          return null;
        },
        textInputType: TextInputType.emailAddress,
        visiblePassword: false,
        placeholder: 'Téléphone ou adresse email',
        icon:  Icons.email,
        max: 80
    );
  }

  Widget buildPassword() {
    return InputWidget(
        onChanged: (value) => {_userPassword = value},
        validator: (value) {
          if (value!.isEmpty) {
            return "Entrez votre mot de passe";
          }

          if (!RegExp(r'^\d{4}$').hasMatch(value)) {
            return 'Le mot de passe doit contenir 4 chiffres';
          }
        },
        textInputType: TextInputType.number,
        visiblePassword: true,
        placeholder: 'Mot de passe',
        icon:  Icons.lock,
        max: 4
    );
  }

  //ForgotPassword
  Widget buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ResetPassword()),
            );
          },
      child: const Text(
          'Mot de passe oublié ?',
          style: TextStyle(
              color: Color(0xFF1E354B),
              fontWeight: FontWeight.w600,
              fontSize: 13),
        ),
      ),
    );
  }

  //LoginBtn
  Widget buildLoginBtn(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        width: double.infinity,
        height: 100.0,
        child: Container(
          // color: Color.fromARGB(255, 120, 180, 9),
          padding: EdgeInsets.fromLTRB(75, 0, 75, 0),
          child: ElevatedButton(
            onPressed: () {
              _login();
            },
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23)),
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF103962)),
            child: Text(
              'Se connecter',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ));
  }

  Widget buildSignUpBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SigninScreen()),
        );
      },
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: 'Vous n\'avez pas de compte?',
              style: TextStyle(
                  color: Color(0xFF1E354B),
                  fontSize: 13,
                  fontWeight: FontWeight.w600)),
          TextSpan(
              text: ' Inscrivez-vous',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w700))
        ]),
      ),
    );
  }

   Widget buildEditProfileLink() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChangeProfile()),
        );
      },
      child: Text(
        'MODIFIER LE PROFIL',
        style: TextStyle(
        color: Color(0xFF1E354B),
        fontSize: 13,
        fontWeight: FontWeight.w600))
    );
  }

   Widget buildChangePasswordLink() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChangePassword()),
        );
      },
      child: Text(
        'CHANGER LE MOT DE PASSE',
        style: TextStyle(
        color: Color(0xFF1E354B),
        fontSize: 13,
        fontWeight: FontWeight.w600))
    );
  }

  Widget buildAboutLink(){
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AboutScreen()),
        );
      },
      child: Text(
        'A PROPOS',
        style: TextStyle(
        color: Color(0xFF1E354B),
        fontSize: 13,
        fontWeight: FontWeight.w600))
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
        SystemNavigator.pop(); // Exit the application
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
                          padding: EdgeInsets.fromLTRB(30, 35, 30, 70),
                          width: double.infinity,
                          height: 260,
                          decoration: BoxDecoration(
                            color: Color(0xFF103962),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                            ),
                          ),
                          child: Center(
                              child: Image.asset(
                            "assets/images/package.png",
                            height: 135,
                          ))),
                      SizedBox(height: 60),
                      Container(
                          padding: EdgeInsets.fromLTRB(43, 5, 43, 0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                buildText(),
                                SizedBox(height: 45),
                                buildEmail(),
                                SizedBox(height: 22),
                                buildPassword(),
                                SizedBox(height: 10),
                                buildForgotPasswordBtn(),
                                SizedBox(height: 4),
                                buildLoginBtn(context),
                                SizedBox(height: 25),
                                buildSignUpBtn(),
                                // buildEditProfileLink(),
                                // SizedBox(height: 5),
                                // buildChangePasswordLink(),
                                // SizedBox(height: 5),
                                // buildAboutLink()
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
    );}
}
