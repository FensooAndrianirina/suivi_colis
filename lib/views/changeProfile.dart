import 'package:client_apk/views/listScreen.dart';
import 'package:client_apk/views/loginScreen.dart';
import 'package:client_apk/views/changePassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:client_apk/views/textField_component.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:client_apk/routes.dart';
import 'package:dio/dio.dart';
import 'package:client_apk/services/profile_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/const.dart';
import '../utils/util.dart';



class ChangeProfile extends StatefulWidget {
  const ChangeProfile({super.key});
  
  @override
  _ChangeProfileState createState() => _ChangeProfileState();
}

class _ChangeProfileState extends State<ChangeProfile> {
   Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }
  String _nom = ""; 
  String _email = ""; 
  String _telephone = ""; 
  String _contact = ""; 
  String _facebook = ""; 
  String _whatsapp = ""; 
  String _adresse = ""; 
  String token = '';
  
  
  static bool isName(String value) {
    //at least two letters that starts with an uppercase letter
    return RegExp(r'^(?=.*[a-zA-Z].*[a-zA-Z])(?=.*[A-Z])^[A-Z].*$').hasMatch(value);
  }

  static bool isEmail(String value) {
    // Use a regular expression to check if value is a valid email address
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
  }   

  static bool isContact(String value) {
    // Contains 10 - 15 and can start with +
    return RegExp(r'^\+?\d{10,15}$').hasMatch(value);

  }

  static bool isPhoneNumber(String value) {
    // Contains 10 - 15 and can start with +
    return RegExp(r'^\+?\d{10,15}$').hasMatch(value);

  }

  static bool isFb(String value){
      //at least 2 letters
      return RegExp(r'[a-zA-Z].*[a-zA-Z]').hasMatch(value);
  }

  static bool isWhats(String value){
      // Contains 10 - 15 and can start with +
       return RegExp(r'^\+?\d{10,15}$').hasMatch(value);
  }

  static bool isAddress(String value){
      //at least 5 letters
      return RegExp(r'[a-zA-Z].*[a-zA-Z].*[a-zA-Z].*[a-zA-Z].*[a-zA-Z]').hasMatch(value);
  }

  _changeProfile() async {
    print("MANDEHA LE IZY AN");
    if (formKey.currentState!.validate()) {
    print("VALIDATED");

      try {
        var rep = await ProfileService()
          .profile(_nom, _email, _telephone, _adresse, _facebook, _whatsapp, _contact);          
        if(rep == 200){
          Navigator.push(
            context,
              MaterialPageRoute(
                builder: (BuildContext context) => ListScreen(),
              ),
            );
        } 
        else{
            Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => ChangeProfile(),
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
    else {
      print("TSY VALIDE");
    }
  }

  void redirectionToListScreen() {
      Navigator.push(
        context, MaterialPageRoute(builder: (context) => ListScreen()));
    }

  late SharedPreferences prefs;

  void editUserProfile(String nom, String email, String telephone, String adresse, String facebook, String whatsapp, String contact) async {
    var api = Const.host + "/api-client/profil";
    final dio = new Dio();

    //API Input
    var data = {
        "nom": nom, 
        "email": email,
        "telephone": telephone,
        "adresse": adresse,
        "facebook": facebook,
        "whatsapp": whatsapp,
        "contact": contact
    };

    Response? response = null;
    var body = null;

    try {
      response = await dio.put(api, data: data);
      if (response != null) {
        print("ATO NY MASO");
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
  }

  
  @override
    void initState() {
      super.initState();
      // Util.getToken();
      retrieveUserData();
    }

  Future<void> getToken() async {
      try {
        String userToken = await Util.getToken();
        setState(() {
          token = userToken;
        });
      } catch (e) {
        // Handle unauthorized access
        print(e.toString());
      }
    }

  Future<void> saveUserData(String nom, String email, String telephone, String adresse, String facebook, String whatsapp, String contact) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // Save the user data using the provided keys
  await prefs.setString('nom', nom);
  await prefs.setString('email', email);
  await prefs.setString('telephone', telephone);
  await prefs.setString('adresse', adresse);
  await prefs.setString('facebook', facebook);
  await prefs.setString('whatsapp', whatsapp);
  await prefs.setString('contact', contact);

  // print('User data saved to shared preferences');
}

void retrieveUserData() async {
  

  // Retrieve the user data from shared preferences
  // String? retrievedNom = prefs.getString('nom');
  // String? retrievedEmail = prefs.getString('email');
  // String? retrievedTelephone = prefs.getString('telephone');
  // String? retrievedAdresse = prefs.getString('adresse');
  // String? retrievedFacebook = prefs.getString('facebook');
  // String? retrievedWhatsApp = prefs.getString('whatsapp');
  // String? retrievedContact = prefs.getString('contact');

  _nom = 'fens';
  _email = 'riana.test1@gmail.com';
  _telephone = '0346611189';
  _adresse = 'Adiresy';
  _facebook = 'Pseudo';
  _whatsapp = '0346611185';
  _contact = '0346611183';

  // Assign the retrieved user data to the widget's variables
  setState(() {
    // _nom = nom ?? '';
    // _email = email ?? '';
    // _telephone = telephone ?? '';
    // _adresse = adresse ?? '';
    // _facebook = facebook ?? '';
    // _whatsapp = whatsApp ?? '';
    // _contact = contact ?? '';
    
    _nom = _nom;
    _email = _email;
    _telephone = _telephone;
    _adresse = _adresse;
    _facebook = _facebook;
    _whatsapp = _whatsapp;
    _contact = _contact;
    
  // _nom = 'fens';
  // _email = 'riana.test1@gmail.com';
  // _telephone = '0346611189';
  // _adresse = 'Adiresy';
  // _facebook = 'Pseudo';
  // _whatsapp = '0346611185';
  // _contact = '0346611183';
  });
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
  // Widget buildName() {
  //   return InputWidget(
  //     onChanged: (value) => {_nom = value},
  //     validator: (value) {
  //        if (value == null || value.isEmpty) {
  //           return 'Entrez votre nom et prénom';
  //         }
         
  //       else{
  //         if (value.length >= 2) {
  //           if (!isName(value)) {
  //             return 'Ce champ doit commencer par une majuscule';
  //           } 
  //         }
  //         else {
  //           return 'Ce champ doit contenir au moins 2 lettres';
  //         }
  //       }

  //     },
  //     textInputType: TextInputType.text,
  //     visiblePassword: false,
  //     placeholder: "Nom(s) et prénom(s)*",
  //     icon: Icons.people,
  //     max: 100,
  //   );
  // }

  Widget buildName() {
  return InputWidget(
    onChanged: (value) {
      _nom = value;
    },
    validator: (value) {
      // Validation logic
    },
    textInputType: TextInputType.text,
    visiblePassword: false,
    placeholder: "Nom(s) et prénom(s)*",
    icon: Icons.people,
    max: 100,
    initialValue: _nom, // Set the initial value from the retrieved data
  );
}


  //Email
  // Widget buildEmail() {
  //    return InputWidget(
  //       onChanged: (value) => {_email = value},
  //       validator: (value) {
  //         if (value == null || value.isEmpty) {
  //           return 'Entrez votre adresse mail';
  //         }
  //         if (!isEmail(value)) {
  //           return 'Entrez une adresse mail valide';
  //         }
  //         return null;
  //       },
  //       textInputType: TextInputType.text,
  //     visiblePassword: false,
  //     placeholder: 'Adresse email*',
  //     icon:  Icons.email,
  //     max: 100,
  //   );
  // }
  Widget buildEmail() {
     return InputWidget(
        onChanged: (value) => {_email = value},
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Entrez votre adresse mail';
          }
          if (!isEmail(value)) {
            return 'Entrez une adresse mail valide';
          }
          return null;
        },
        textInputType: TextInputType.text,
      visiblePassword: false,
      placeholder: 'Adresse email*',
      icon:  Icons.email,
      max: 100,
      initialValue: _email, 
      enabled: false, 
      decoration: InputDecoration(
        fillColor: Color(0xFF707070)   
      )   
    );
  }

  //Tel
  // Widget buildTel() {
  //   return InputWidget(
  //       onChanged: (value) => {_telephone = value},
  //       validator: (value) {
  //         if (value == null || value.isEmpty) {
  //           return 'Entrez votre numéro de téléphone';
  //         }

  //         if (!isPhoneNumber(value)) {
  //           return 'Entrez un numéro de téléphone valide';
  //         }
  //         return null;
  //       },
  //       textInputType: TextInputType.text,
  //     visiblePassword: false,
  //     placeholder: 'Numéro de téléphone*',
  //     icon:  Icons.phone_enabled_rounded,
  //     max: 15,
  //   );
  // }
  Widget buildTel() {
    return InputWidget(
        onChanged: (value) => {_telephone = value},
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Entrez votre numéro de téléphone';
          }

          if (!isPhoneNumber(value)) {
            return 'Entrez un numéro de téléphone valide';
          }
          return null;
        },
        textInputType: TextInputType.text,
      visiblePassword: false,
      placeholder: 'Numéro de téléphone*',
      icon:  Icons.phone_enabled_rounded,
      max: 15,
      initialValue: _telephone, 

    );
  }

   //Contact Tel
  // Widget buildContactTel() {
  //   return InputWidget(
  //       onChanged: (value) => {_contact = value},
  //       validator: (value) {
  //         if (value == null || value.isEmpty) {
  //           return null; 
  //         }
  //         if (!isContact(value)) {
  //           return 'Entrez un numéro de téléphone valide';
  //         }
  //         return null;
  //       },
  //       textInputType: TextInputType.text,
  //     visiblePassword: false,
  //     placeholder: 'Autre numéro de téléphone',
  //     icon:  Icons.phone_enabled_rounded,
  //     max: 15,
  //   );
  // }
  Widget buildContactTel() {
    return InputWidget(
        onChanged: (value) => {_contact = value},
        validator: (value) {
          if (value == null || value.isEmpty) {
            return null; 
          }
          if (!isContact(value)) {
            return 'Entrez un numéro de téléphone valide';
          }
          return null;
        },
        textInputType: TextInputType.text,
      visiblePassword: false,
      placeholder: 'Autre numéro de téléphone',
      icon:  Icons.phone_enabled_rounded,
      max: 15,
      initialValue: _contact, 
    );
  }

  //Facebook
  // Widget buildFb() {
  //    return InputWidget(
  //       onChanged: (value) => {_facebook = value},
  //       validator: (value) {
  //         if (value == null || value.isEmpty) {
  //           return null; 
  //         }
  //         if (!isFb(value)) {
  //           return 'Entrez votre pseudo Facebook';
  //         }
  //         return null;
  //       },
  //       textInputType: TextInputType.text,
  //     visiblePassword: false,
  //     placeholder: 'Pseudo Facebook',
  //     icon: Icons.facebook,
  //     max: 100,
  //   );
  // }
   Widget buildFb() {
     return InputWidget(
        onChanged: (value) => {_facebook = value},
        validator: (value) {
          if (value == null || value.isEmpty) {
            return null; 
          }
          if (!isFb(value)) {
            return 'Entrez votre pseudo Facebook';
          }
          return null;
        },
        textInputType: TextInputType.text,
      visiblePassword: false,
      placeholder: 'Pseudo Facebook',
      icon: Icons.facebook,
      max: 100,
      initialValue: _facebook, 
    );
  }

  //Whats
  // Widget buildWhatsApp() {
  //    return InputWidget(
  //       onChanged: (value) => {_whatsapp = value},
  //       validator: (value) {
  //         if (value == null || value.isEmpty) {
  //           return null; 
  //         }
  //         if (!isWhats(value)) {
  //           return 'Entrez votre numéro WhatsApp';
  //         }
  //         return null;
  //       },
  //       textInputType: TextInputType.text,
  //     visiblePassword: false,
  //     placeholder: 'Numéro WhatsApp',
  //     icon: Icons.add_ic_call_rounded,
  //     max: 15,
   
  //   );
  // }
   Widget buildWhatsApp() {
     return InputWidget(
        onChanged: (value) => {_whatsapp = value},
        validator: (value) {
          if (value == null || value.isEmpty) {
            return null; 
          }
          if (!isWhats(value)) {
            return 'Entrez votre numéro WhatsApp';
          }
          return null;
        },
        textInputType: TextInputType.text,
      visiblePassword: false,
      placeholder: 'Numéro WhatsApp',
      icon: Icons.add_ic_call_rounded,
      max: 15,
      initialValue: _whatsapp, 

    );
  }

 
  //adresse
//   Widget buildAdd() {
//   return InputWidget(
//     onChanged: (value) => {_adresse = value},
//     validator: (value) {
//       if (value == null || value.isEmpty) {
//         return null; 
//       }
//       if (!isAddress(value)) {
//         return "L'adresse est trop courte";
//       }
//       return null;
//     },
//     textInputType: TextInputType.text,
//     visiblePassword: false,
//     placeholder: 'Adresse', 
//     icon: Icons.maps_home_work_rounded,
//     max: 100, 
//   );
// }
Widget buildAdd() {
  return InputWidget(
    onChanged: (value) => {_adresse = value},
    validator: (value) {
      if (value == null || value.isEmpty) {
        return null; 
      }
      if (!isAddress(value)) {
        return "L'adresse est trop courte";
      }
      return null;
    },
    textInputType: TextInputType.text,
    visiblePassword: false,
    placeholder: 'Adresse', 
    icon: Icons.maps_home_work_rounded,
    max: 100, 
    initialValue: _adresse, 
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
              print("dssss");
              _changeProfile();  
            },
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23)),
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF103962)),
            child: Text(
              "Sauvegarder",
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.fromLTRB(15, 45, 15, 15),
                          child: Center(
                              child: Image.asset("assets/images/profile.png", height: 60,
                                  )
                               ),       
                            ),
                      SizedBox(height: 5),
                      Container(
                        padding: EdgeInsets.fromLTRB(43, 5, 43, 0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              buildText(),
                              SizedBox(height:30),
                              buildName(),
                              SizedBox(height: 10),
                              buildEmail(),
                              SizedBox(height: 10),
                              buildTel(),
                              SizedBox(height: 10),
                              buildContactTel(),
                              SizedBox(height: 10),
                              buildFb(),
                              SizedBox(height: 10),
                              buildWhatsApp(),
                              SizedBox(height: 10),
                              buildAdd(),
                              SizedBox(height: 7),
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