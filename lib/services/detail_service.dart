import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:client_apk/models/user_model.dart';
import 'package:client_apk/models/pack_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../config/const.dart';
import '../utils/util.dart';
import '../exceptions/api_exception.dart';



class DetailService {

  Future<List<PackModel>> packList() async {
    List<PackModel> pack = [];
    
    try{
      print("getToken");
      String token = await Util.getToken();
   
    
      // PackModel pack = PackModel();
      // String packReference = pack.reference;
    
      print(token);
      Map<String, String> headers = 
      {
        'x-access-token': token
      };
     
      var uri = Uri.parse("${Const.host}/api-client/declarations/reference");
     
      var reponse = await http.get( 
        uri,
        headers: headers
      );
      if (reponse.statusCode == 200) {

        dynamic data = jsonDecode(reponse.body);

        
        if (data['CodeRetour'] == 200) {
          print('200');
          print(data);
          print('LISTE JSON');
          print(data['Data']);

          List<dynamic> mesColis = data['Data'];

          print('PRINT LISITRA');
          print(mesColis);

          for( var item in mesColis) {
            print('ITEM');
            Map<String, dynamic> itemMap = Map<String, dynamic>.from(item.cast<String, dynamic>());
            print(itemMap);
            print('PM');
            PackModel packM = PackModel.fromJson(itemMap);
            print(packM);
            pack.add(packM);
          }
          print('PACKAGES');
          print(pack);

          return pack;
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
        print('CATCH');
        print(e);
      // Gérer toutes les autres exceptions ici
       throw ApiException("Erreur venant du serveur");
     }
  }
}