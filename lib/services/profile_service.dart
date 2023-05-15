import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:client_apk/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../config/const.dart';
import '../exceptions/api_exception.dart';
import '../utils/util.dart';


class ProfileService {

   Future<dynamic> profile(String nom, String email, String telephone, String adresse, String facebook, String whatsapp, String contact) async {
    
    try{
      String token = await Util.getToken();
      print("getToken");
      // String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjgzNzk0NzYwLCJleHAiOjE2ODM4ODExNjB9.YRUWFcvkZvldyVOYOC2sJe6yxlm9EYf_znJ0Zkdxa_A";

      print(token);
      Map<String, String> headers = 
      {
        'x-access-token': token
      };

      var body = 
      {
        "nom": nom, 
        "email": email,
        "telephone": telephone,
        "adresse": adresse,
        "facebook": facebook,
        "whatsapp": whatsapp,
        "contact": contact
      };

      var uri = Uri.parse("${Const.host}/api-client/profil");

      var reponse = 
        await http.put( 
          uri, 
          body: body,
          headers: headers
        );

      print("REPONSE");

       if (reponse.statusCode == 200) {
          print("ANATY 200");
         dynamic data = jsonDecode(reponse.body);
         if (data['CodeRetour'] == 200 ) {
            return data['CodeRetour'];
         } else {
            throw ApiException(data['DescRetour']);
         }
       } else {
          print("TSY ANATY 200");
          throw ApiException("ERREUR_SERVEUR");
       }
     }on ApiException catch (e) {
        print("API");

        throw e;
     }
     on SocketException catch (_) {
       // Gérer l'exception de connexion Internet manquante ici
        print("INTERNET");

        throw ApiException("PAS_INTERNET");
     } catch (e) {
       // Gérer toutes les autres exceptions ici
        print("SERVEUR");

       throw ApiException("ERREUR_SERVEUR");
     }

  }
}