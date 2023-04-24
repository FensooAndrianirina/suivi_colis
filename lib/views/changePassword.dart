import 'package:client_apk/views/signinScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';



class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  _ChangePassword createState() => _ChangePassword();
}

class _ChangePassword extends State<ChangePassword> {

  String _userEmail="",_userPassword="";
  bool _passwordVisible = false;
  bool _showOldPasswordError = false;

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
    double containerHeight = _showOldPasswordError ? 70 : 50;
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
          child: TextFormField(
            onChanged: (value)=>{
            _userPassword=value
            },
            // controller: _passwordController,
            obscureText: !_passwordVisible,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                 suffix: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility_off : Icons.visibility,
                    color: Color(0xFF103962),
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
                border: InputBorder.none,
                // contentPadding: EdgeInsets.only(top: 1),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xff295078),
                ),
                hintText: 'Ancien mot de passe',
                hintStyle: TextStyle(color: Colors.black38, fontSize: 13)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    _showOldPasswordError = true;
                    return 'Veuillez saisir votre mot de passe';
                  }
                  if (value.length < 6) {
                    _showOldPasswordError = true;
                    return 'Le mot de passe doit contenir au moins 8 caractères';
                  }
                  if (!RegExp(r'[A-Z]').hasMatch(value)) {
                    _showOldPasswordError = true;
                    return 'Le mot de passe doit contenir au moins une majuscule';
                  }
                  if (!RegExp(r'[a-z]').hasMatch(value)) {
                    _showOldPasswordError = true;
                    return 'Le mot de passe doit contenir au moins une minuscule';
                  }
                  if (!RegExp(r'[0-9]').hasMatch(value)) {
                    _showOldPasswordError = true;
                    return 'Le mot de passe doit contenir au moins un chiffre';
                  }
                  if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                    _showOldPasswordError = true;
                    return 'Le mot de passe doit contenir au moins un caractère spécial';
                  }
                _showOldPasswordError = false;
                return null;
            },
          ),
        )
      ],
    );
  }

  //NEW Password
  Widget buildNewPassword() {
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
          child: TextFormField(
            onChanged: (value)=>{
            _userPassword=value
            },
            // controller: _passwordController,
            obscureText: !_passwordVisible,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                 suffix: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility_off : Icons.visibility,
                    color: Color(0xFF103962),
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
                border: InputBorder.none,
                // contentPadding: EdgeInsets.only(top: 1),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xff295078),
                ),
                hintText: 'Nouveau mot de passe',
                hintStyle: TextStyle(color: Colors.black38, fontSize: 13)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir votre mot de passe';
                  }
                  if (value.length < 6) {
                    return 'Le mot de passe doit contenir au moins 8 caractères';
                  }
                  if (!RegExp(r'[A-Z]').hasMatch(value)) {
                    return 'Le mot de passe doit contenir au moins une majuscule';
                  }
                  if (!RegExp(r'[a-z]').hasMatch(value)) {
                    return 'Le mot de passe doit contenir au moins une minuscule';
                  }
                  if (!RegExp(r'[0-9]').hasMatch(value)) {
                    return 'Le mot de passe doit contenir au moins un chiffre';
                  }
                  if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                    return 'Le mot de passe doit contenir au moins un caractère spécial';
                  }
                return null;
            },
          ),
        )
      ],
    );
  }


  Widget buildConfirmPassword() {
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
          child: TextFormField(
            onChanged: (value)=>{
            _userPassword=value
            },
            // controller: _passwordController,
            obscureText: !_passwordVisible,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                 suffix: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility_off : Icons.visibility,
                    color: Color(0xFF103962),
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
                border: InputBorder.none,
                // contentPadding: EdgeInsets.only(top: 1),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xff295078),
                ),
                hintText: 'Confirmation de mot de passe',
                hintStyle: TextStyle(color: Colors.black38, fontSize: 13)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez saisir votre mot de passe';
                  }
                  if (value.length < 6) {
                    return 'Le mot de passe doit contenir au moins 8 caractères';
                  }
                  if (!RegExp(r'[A-Z]').hasMatch(value)) {
                    return 'Le mot de passe doit contenir au moins une majuscule';
                  }
                  if (!RegExp(r'[a-z]').hasMatch(value)) {
                    return 'Le mot de passe doit contenir au moins une minuscule';
                  }
                  if (!RegExp(r'[0-9]').hasMatch(value)) {
                    return 'Le mot de passe doit contenir au moins un chiffre';
                  }
                  if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                    return 'Le mot de passe doit contenir au moins un caractère spécial';
                  }
                return null;
            },
          ),
        )
      ],
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
              //loginUser(_userEmail,_userPassword);
              // redirectionToListScreen();
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
              'Sauvegarder',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ));
  }

  Widget buildComeBackLink() {
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
              text: 'Retour vers la page X',
              style: TextStyle(
                  color: Color(0xFF1E354B),
                  fontSize: 13,
                  fontWeight: FontWeight.w600))
        ]),
      ),
    );
  }


//Popup
// Future<void> _showPopupDialog(BuildContext context) async {
//   showDialog(
//     context: context,
//     builder: (_) {
//       bool isPopupClosed = false;
//       return StatefulBuilder(
//         builder: (context, setState) {
//           if (isPopupClosed) {
//             Navigator.of(context).pop();
//           }
//           return AlertDialog(
//             backgroundColor: Colors.white,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             contentPadding: EdgeInsets.all(23),
//             titlePadding: EdgeInsets.fromLTRB(16, 16, 0, 0),
//             contentTextStyle: TextStyle(
//               color: Color(0xFF032547),
//               fontSize: 18,
//             ),
//             titleTextStyle: TextStyle(
//               color: Color(0xFF032547),
//               fontSize: 20,
//             ),
//             title: Padding(
//               padding: const EdgeInsets.only(left: 8, right: 11),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween, // Change to center
//                 children: [           
//                   Text(
//                     'Déconnexion ?',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w700,
//                       color: Color(0xFF032547),
//                     ),
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.close),
//                     color: Color(0xFFD4833B),
//                     onPressed: () {
//                       setState(() {
//                         isPopupClosed = true;
//                       });
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Souhaitez-vous vraiment vous déconnecter ?',
//                   style: TextStyle(
//                     fontSize: 13,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xFF032547),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         // Do something on 'Oui' button press
//                       },
//                       style: ButtonStyle(
//                         backgroundColor:
//                             MaterialStateProperty.all<Color>(Color(0xFFD4833B)),
//                         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                           RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                         ),
//                       ),
//                       child: Text('Oui'),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       style: ButtonStyle(
//                         backgroundColor:
//                             MaterialStateProperty.all<Color>(Color(0xFFD4833B)),
//                         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                           RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                         ),
//                       ),
//                       child: Text('No'),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             actions: [],
//           );
//         },
//       );
//     },
//   );
// }

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
                          SizedBox(height: 160),
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
                                  SizedBox(height: 15),
                                  buildComeBackLink()
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
