import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:client_apk/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../config/const.dart';
import '../exceptions/api_exception.dart';

class LoginService {

  //  gethttp () async {
  //   final dio = Dio();
  //   print("ato");
  //   final response = await dio.get('https://reqres.in/api/users?page=2');
  //   return response;
  //   }

   Future<dynamic> login(String login, String pwd) async {
     try{
       var uri = Uri.parse("${Const.host}/api-client/login");
       var reponse = await http.post(uri,body: {"login": login, "password": pwd});
      /* var reponse = await http.post(Uri.parse("${Const.host}/api/client/login"),
           body: {"login": login, "password": pwd});*/
       if (reponse.statusCode == 200) {
         dynamic data = jsonDecode(reponse.body);
         if (data['CodeRetour'] == 200 || data['CodeRetour'] == 202) {
           final instance = await SharedPreferences.getInstance();
           await instance.setString("token", data['Data']['token']);
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