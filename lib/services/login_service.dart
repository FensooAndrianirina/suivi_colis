import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../config/const.dart';
import '../exceptions/api_exception.dart';

class LoginService {

   Future<dynamic> login(String login, String pwd) async {
     try{
       var uri = Uri.parse("${Const.host}/api-client/login");
       var reponse = await http.post(uri,body: {"login": login, "password": pwd});
      /* var reponse = await http.post(Uri.parse("${Const.host}/api/client/login"),
           body: {"login": login, "password": pwd});*/
       if (reponse.statusCode == 200) {
         print('1');
      
         dynamic data = jsonDecode(reponse.body);
         if (data['CodeRetour'] == 200 || data['CodeRetour'] == 202) {
          int id =  data['Data']['id'];
          final instance = await SharedPreferences.getInstance();
          await instance.setString("token", data['Data']['token'] ?? '' );
          await instance.setString("id", '$id');
          await instance.setString("nom", data['Data']['nom'] ?? '');
          await instance.setString("email", data['Data']['email'] ?? '');
          await instance.setString("adresse", data['Data']['adresse'] ?? '');
          await instance.setString("tel", data['Data']['tel'] ?? '');
          await instance.setString("contact", data['Data']['contact'] ?? '');
          await instance.setString("compteFB", data['Data']['compteFB'] ?? '');
          await instance.setString("whatsapp", data['Data']['whatsapp'] ?? '');

          print("*** end ****");
           return data['CodeRetour'];
         } else {
           print('API EXCEPTION 1');
           throw ApiException(data['DescRetour']);
         }
       } else {
         print('API EXCEPTION 2');
         throw ApiException("ERREUR_SERVEUR");
       }
      }on ApiException catch (e) {
        print('INDRISY');  
        throw e;
     }
      on SocketException catch (_) {
       // Gérer l'exception de connexion Internet manquante ici
       print('INTERNET');
       throw ApiException("PAS_INTERNET");
      } catch (e) {
       // Gérer toutes les autres exceptions ici
       print('catch');
       print(e);
       throw ApiException("ERREUR_SERVEUR");
     }
  }
}