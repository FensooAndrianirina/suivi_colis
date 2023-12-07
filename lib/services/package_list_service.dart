import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:client_apk/models/user_model.dart';
import 'package:client_apk/models/package_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../config/const.dart';
import '../utils/util.dart';
import '../exceptions/api_exception.dart';



class PackageListService {

  Future<List<PackageModel>> packageList() async {
    List<PackageModel> packages = [];
    
    try{
      String token = await Util.getToken();
      UserModel user1 = await Util.getUser();
      
      Map<String, String> headers = 
      {
        'x-access-token': token
      };
     
      var uri = Uri.parse("${Const.host}/api-client/declarations/clients/${user1.id}");
     
      var reponse = await http.get( 
        uri,
        headers: headers
      );
      if (reponse.statusCode == 200) {

        dynamic data = jsonDecode(reponse.body);

        
        if (data['CodeRetour'] == 200) {
          List<dynamic> lisitra = data['Data'];
          for( var item in lisitra) {
            Map<String, dynamic> itemMap = Map<String, dynamic>.from(item.cast<String, dynamic>());
            PackageModel pm = PackageModel.fromJson(itemMap);
            packages.add(pm);
          }
          return packages;
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
        throw ApiException("Token inexistant");
      }
      on SocketException catch (_) {
        // Gérer l'exception de connexion Internet manquante ici
        throw ApiException("Pas d'internet");
      } catch (e) {
      // Gérer toutes les autres exceptions ici
       throw ApiException("Erreur venant du serveur");
     }
  }
}