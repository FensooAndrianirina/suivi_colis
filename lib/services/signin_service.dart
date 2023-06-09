import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../config/const.dart';
import '../exceptions/api_exception.dart';

class SigninService {

   Future<dynamic> signin(String nom, String email, String telephone, String adresse, String facebook, String whatsapp, String contact) async {
    try{
      var uri = Uri.parse("${Const.host}/api-client/register");
      var reponse = 
        await http.post( 
          uri, 
          body: {
              "nom": nom, 
              "email": email,
              "telephone": telephone,
              "adresse": adresse,
              "facebook": facebook,
              "whatsapp": whatsapp,
              "contact": contact
            }
          );
    
       if (reponse.statusCode == 200) {
         dynamic data = jsonDecode(reponse.body);
         return data;
       } else {
         throw ApiException("ERREUR_SERVEUR");
       }
     }on ApiException catch (e) {
       throw e;
     }
     on SocketException catch (_) {
       // Gérer l'exception de connexion Internet manquante ici
       throw ApiException("PAS_INTERNET");
     } catch (e) {
       // Gérer toutes les autres exceptions ici
       throw ApiException("ERREUR_SERVEUR");
     }

  }
}


//TENA IZY
// class SigninService {
//   Future<void> showAlertDialog(
//   BuildContext context,
//   String title,
//   String message,
//   String linkText,
// ) async {
//   return showDialog<void>(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text(title),
//         content: RichText(
//           text: TextSpan(
//             children: [
//               TextSpan(text: message),
//               TextSpan(
//                 text: linkText,
//                 style: TextStyle(
//                   color: Color(0xFF052642),
//                   decoration: TextDecoration.underline,
//                 ),
//                 recognizer: TapGestureRecognizer()
//                   ..onTap = () {
//                     redirectionToLoginScreen();
//                   },
//               ),
//             ],
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               },
//               child: Text('Fermer'),
//             ),
//           ],
//         );
//       },
//     );
//   }
  
//    void redirectionToLoginScreen() {
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => LoginScreen(texteNotif: texteNotif)));
//   }
//   Future<dynamic> signin(String nom, String email, String telephone, String adresse, String facebook, String whatsapp, String contact) async {
//     try {
//       var uri = Uri.parse("${Const.host}/api-client/register");
//       var response = await http.post(uri, body: {
//         "nom": nom,
//         "email": email,
//         "telephone": telephone,
//         "adresse": adresse,
//         "facebook": facebook,
//         "whatsapp": whatsapp,
//         "contact": contact
//       });

//       if (response.statusCode == 200) {
//         dynamic data = jsonDecode(response.body);
//         if (data['CodeRetour'] == 200 || data['CodeRetour'] == 202) {
//           return data['CodeRetour'];
//         } else {
//           throw ApiException(data['DescRetour']);
//         }
//       } else if (response.statusCode == 502) {
//         String errorDetail = 'Cet email est déjà associé à un compte';
//         String linkText = 'ici';
//         await showAlertDialog(
//           context,
//           'Cet email est déjà associé à un compte',
//           'Cherchez-vous à vous connecter ? Cliquez ',
//           linkText,
//         );
//         redirectionToLoginScreen();
//         throw ApiException('ERREUR_SERVEUR');
//       } else {
//         throw ApiException("ERREUR_SERVEUR");
//       }
//     } on ApiException catch (e) {
//       throw e;
//     } on SocketException catch (_) {
//       throw ApiException("PAS_INTERNET");
//     } catch (e) {
//       throw ApiException("ERREUR_SERVEUR");
//     }
//   }
// }
