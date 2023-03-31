import 'package:client_apk/views/listScreen.dart';
import 'package:client_apk/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:client_apk/views/detailScreen.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../config/const.dart';
import '../interceptors/logging_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginService loginService =  new LoginService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String _userEmail="",_userPassword="";


  //TODO atao dynamique eto ny nom an'ilay screen ho anaovana redirection
  void redirectionToListScreen(){
       Navigator.push(context, MaterialPageRoute(builder: (context)=>ListScreen()));
  }

  late SharedPreferences prefs;

  void loginUser(String email,String password) async{
    
    //TODO Afindra any @ const daholo ny endpoint rehetra
    var api=Const.host+"/api/client/login";
    final dio=new Dio();

    //API Input 
    var data={"email":email,"password":password};

    Response? response=null;
    var body=null;

    try{
      
        response=await dio.post(api,data:data);
        if(response!=null){
               Map<String,dynamic> responseMap=response.data;
              int _codeRetour=responseMap["codeRetour"];
              String _descRetour=responseMap["descRetour"];

              if(_codeRetour==200){
                  //Saving user information inside SharedPref
                  prefs.setString('token', _descRetour);

                  redirectionToListScreen();
              
              }
              else{
                   throw _descRetour;
              }
             
        }
        else{
          throw "Erreur venant du serveur";
        }
     
      }
    catch(e){
          print(e.toString());
            Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        // textcolor: Colors.white
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
            'Madagroupage',
            style: TextStyle(
            color: Color(0xff295078),
            fontSize: 35,
            fontWeight: FontWeight.w900),
          ),
        )
      ],
    );
  }

  //Emails
  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
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
          child: TextField(
            onChanged: (value) => {
              _userEmail=value
            },
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xff295078),
                ),
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.black38, fontSize: 13)),
          ),
        )
      ],
    );
  }

  //Password
  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
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
          child: TextField(
            onChanged: (value)=>{
            _userPassword=value
            },
            controller: _passwordController,
            obscureText: true,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xff295078),
                ),
                hintText: 'Mot de passe',
                hintStyle: TextStyle(color: Colors.black38, fontSize: 13)),
          ),
        )
      ],
    );
  }

  //ForgotPassword
  Widget buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => print("Forgot Password pressed"),
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          padding: const EdgeInsets.only(right: 0),
          textStyle: const TextStyle(fontSize: 16),
        ),
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
              loginUser(_userEmail,_userPassword);
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

  //buildSignUpBtn
  Widget buildSignUpBtn() {
    return GestureDetector(
      onTap: () => print("Sign Up Pressed"),
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
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 70),
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
                              child: Image(
                            image: AssetImage('/../images/package.png'),
                            height: 135,
                          ))),
                      SizedBox(height: 60),
                      Container(
                        padding: EdgeInsets.fromLTRB(43, 5, 43, 0),
                        child: Column(
                          children: [
                            buildText(),
                            SizedBox(height:45),
                            buildEmail(),
                            SizedBox(height: 22),
                            buildPassword(),
                            SizedBox(height: 10),
                            buildForgotPasswordBtn(),
                            SizedBox(height: 4),
                            buildLoginBtn(context),
                            SizedBox(height: 25),
                            buildSignUpBtn(),
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

