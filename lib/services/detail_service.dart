
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:client_apk/exceptions/api_exception.dart';
import 'package:client_apk/models/colis_model.dart';
import 'package:client_apk/models/payment_model.dart';
import 'package:client_apk/models/pack_model.dart';
import '../config/const.dart';
import '../utils/util.dart';
import 'package:client_apk/models/user_model.dart';




class DetailService {
 
  Future<PackModel> getPackageDetails(String reference) async {
    
    try {
      String token = await Util.getToken();
     
      Map<String, String> headers = 
      {
        'x-access-token': token
      };
      final url = "${Const.host}/api-client/declarations/${reference}";

      var uri =  Uri.parse(url);
     
      var response = await http.get(
        uri,
        headers: headers    
      );


      if (response.statusCode == 200) {

        final jsonData = jsonDecode(response.body);

        if (jsonData['CodeRetour'] == 200) {
          final data = jsonData['Data'];
          
          List<ColisModel> colisList = [];
          if (data['colis'] != null) {
            colisList = (data['colis'] as List)
                .map((item) => ColisModel(
                      contenu: item['contenu'],
                      volume: item['volume'] != null ? item['volume'].toDouble() : 0,
                      poids: item['poids'] != null ? item['poids'].toDouble() : 0,
                      tarifEnvoiEUR:  item['tarifEnvoiEUR'] != null ? item['tarifEnvoiEUR'].toDouble() : 0,
                      nombre: item['nombre'] ?? 0,
                      numeroColis: item['numeroColis'] ?? 1,
                      referenceColis: item['referenceColis']
                    ))
                .toList();
          }

          List<PaymentModel> paymentList = [];
          if (data['paiements'] != null) {
            paymentList = (data['paiements'] as List)
                .map((item) => PaymentModel(
                      reference: item['reference'],
                      datePaiement: item['datePaiement'] != null ? DateTime.parse(item['datePaiement']) : null,
                      montantEUR: item['montantEUR'] != null ? item['montantEUR'].toDouble() ?? 0 : 0,
                 montantMGA: item['montantMGA'] != null ? item['montantMGA'].toDouble() : null,


                      modePaiement: item['modePaiement'] ?? ''
                    ))
                .toList();
          }
      
          return PackModel(
            reference: data['reference'],

            expediteur: data['expediteur'],
            destinataire: data['destinataire'],

            tarifEnvoiEUR: data['tarifEnvoiEUR'] != null ? data['tarifEnvoiEUR'].toDouble() : 0,
            tarifExtraEUR: data['tarifExtraEUR'] != null ? data['tarifExtraEUR'].toDouble() : 0,
            resteAPayerEUR: data['resteAPayerEUR'] != null ? data['resteAPayerEUR'].toDouble() : 0,

            nbreColis: data['nbreColis'],

            lieuDepart: data['lieuDepart'],
            lieuDestination: data['lieuDestination'],

            dateExpedition: data['dateExpedition'] != null ? DateTime.parse(data['dateExpedition']) : null,
            dateArrivee: data['dateArrivee'] != null ? DateTime.parse(data['dateArrivee']) : null,
            dateLivraison: data['dateLivraison'] != null ? DateTime.parse(data['dateLivraison']) : null,

            expediteur_id: data['expediteur_id'],
            destinataire_id: data['destinataire_id'],

            colis: colisList,
            
            contactExpediteur: data['contactExpediteur'] ,
            contactDestinataire: data['contactDestinataire'],

            recuperateur: data['recuperateur'],

            paiements: paymentList,


          );

        }else{

        }
      }else{
        var statuscode = (response.statusCode).toString() ;

      }
    } catch (e) {
  }
    
    throw Exception('Failed to fetch package details');
}


  Future<List<ColisModel>> articleList(String reference) async {
    List<ColisModel> colisList = [];
    
    try{
      String token = await Util.getToken();
      
      Map<String, String> headers = 
      {
        'x-access-token': token
      };
     
      var uri = Uri.parse("${Const.host}/api-client/declarations/${reference}");
     
      var reponse = await http.get( 
        uri,
        headers: headers
      );
      if (reponse.statusCode == 200) {

        dynamic data = jsonDecode(reponse.body);
   
        if (data['CodeRetour'] == 200) {

          List<dynamic> lisitra = data['Data']['colis'];

          for( var item in lisitra) {
            Map<String, dynamic> itemMap = Map<String, dynamic>.from(item.cast<String, dynamic>());
            ColisModel pm = ColisModel.fromJson(itemMap);
            colisList.add(pm);
          }

          return colisList;
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


   Future<List<PaymentModel>> paymentList(String reference) async {
    List<PaymentModel> paymentList = [];
    
    try{
      String token = await Util.getToken();
      
      Map<String, String> headers = 
      {
        'x-access-token': token
      };
     
      var uri = Uri.parse("${Const.host}/api-client/declarations/${reference}");
     
      var reponse = await http.get( 
        uri,
        headers: headers
      );
      if (reponse.statusCode == 200) {

        dynamic data = jsonDecode(reponse.body);

        if (data['CodeRetour'] == 200) {
       
          List<dynamic> liste = data['Data']['paiements'];

          for( var item in liste) {
            Map<String, dynamic> itemMap = Map<String, dynamic>.from(item.cast<String, dynamic>());
            PaymentModel pmt = PaymentModel.fromJson(itemMap);
            paymentList.add(pmt);
          }
          return paymentList;
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

