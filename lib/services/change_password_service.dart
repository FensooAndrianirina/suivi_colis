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

class ChangePasswordService {

  Future<dynamic> changePassword(String password, String newPassword, String confirmPassword) async {
 
    try{
      String token = await Util.getToken();
   
      Map<String, String> headers = 
      {
        'x-access-token': token
      };
     
      var body = 
      {
        'password': password,
        'newPassword': newPassword,
        'confirmPassword': confirmPassword,
      };
   
      var uri = Uri.parse("${Const.host}/api/client/changePwd");
     
      var reponse = await http.post( 
        uri,
        body: body,
        headers: headers
      );
      
      if (reponse.statusCode == 200) {

        dynamic data = jsonDecode(reponse.body);
        
        if (data['CodeRetour'] == 200) {
          return data['CodeRetour'];
         } else {
           throw ApiException(data['DescRetour']);
          }
        } 
        else {
          throw ApiException("Erreur venant du serveur");
        }
      }on ApiException catch (e) {
        throw e;
      }
      on HttpException catch(e) {
        print(e.message);
        throw ApiException("Token inexistant");
      }
      on SocketException catch (_) {
        // Gérer l'exception de connexion Internet manquante ici
        throw ApiException("Pas d'internet");
      } catch (e) {
      // print(e);
      // Gérer toutes les autres exceptions ici
       throw ApiException("Erreur venant du serveur");
     }
  }
}