import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:client_apk/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../config/const.dart';
import '../utils/util.dart';
import '../exceptions/api_exception.dart';

class ChangeProfileService {

   Future<dynamic> changeProfile(String nom, String email, String telephone, String adresse, String facebook, String whatsapp, String contact) async {
    try{
      String token = await Util.getToken();
   
      Map<String, String> headers = 
      {
        'x-access-token': token
      };
     
      var uri = Uri.parse("${Const.host}/api-client/profil");

      var reponse = 
        await http.put( 
          uri, 
          headers: headers,
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
         if (data['CodeRetour'] == 200 || data['CodeRetour'] == 202) {
            return data['CodeRetour'];
         } else {
            throw ApiException(data['DescRetour']);
         }
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