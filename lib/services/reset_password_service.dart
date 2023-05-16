import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../config/const.dart';
import '../utils/util.dart';
import '../exceptions/api_exception.dart';

class ResetPasswordService {

  Future<dynamic> resetPassword(String email) async {
 
    try{
      
      var body = { 'email': email };
   
      var uri = Uri.parse("${Const.host}/api-client/reset-pwd");
     
      var reponse = await http.post( 
        uri,
        body: body,
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