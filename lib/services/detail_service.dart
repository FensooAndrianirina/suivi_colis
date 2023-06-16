
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
      // print("getToken  ETO AMIN ITOOOOOOOO");
      String token = await Util.getToken();
      // String token = "gagzjkjekdfkjzfkjzbefhzbfkzefkzfekzebzef";
     
    
      Map<String, String> headers = 
      {
        'x-access-token': token
      };
      final url = "${Const.host}/api-client/declarations/${reference}";
      // print(url);
      // print('AMBOOOOOONY');

      var uri =  Uri.parse(url);
      // print(uri);
      // print('URRRRRRRRRRRRRRRRI');
      var response = await http.get(
        uri,
        headers: headers    
      );


      if (response.statusCode == 200) {
        print('200');

        final jsonData = jsonDecode(response.body);
        // print(jsonData);

        if (jsonData['CodeRetour'] == 200) {
            print('CODERETOUR = 200');
          final data = jsonData['Data'];
          
          List<ColisModel> colisList = [];
          if (data['colis'] != null) {
            print('TONGA ETO ARY ISIKA AN');
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
            print('TONGA ETO AM PAIMENT AN');
            paymentList = (data['paiements'] as List)
                .map((item) => PaymentModel(
                      reference: item['reference'],
                      datePaiement: item['datePaiement'] != null ? DateTime.parse(item['datePaiement']) : null,
                      montantEUR: item['montantEUR'] != null ? item['montantEUR'].toDouble() ?? 0 : 0,
                      // montantMGA: item['montantMGA'] != null ? item['montantMGA'].toDouble() ?? 0 : 0,
                      // montantMGA: item['montantMGA'] != null ? '${item['montantMGA'].toDouble()} Ariary' : '',
                 montantMGA: item['montantMGA'] != null ? item['montantMGA'].toDouble() : null,


                      modePaiement: item['modePaiement'] ?? ''
                    ))
                .toList();
          }
         
          print("COLIS LIST");
          for( var item in colisList) {
          //  print("item");
          //   print(item.contenu);
          //   print(item.volume);
          //   print(item.poids);
          //   print(item.tarifEnvoiEUR);
          //   print(item.nombre);
          //   print(item.numeroColis);
          //   print(item.referenceColis);

          }
      
          print("******** RETURN ********");
          // print(data['reference']);
          // print(data['expediteur']);
          // print(data['destinataire']);
          // print(data['tarifEnvoiEUR']);
          // print(data['tarifExtraEUR']);
          // print(data['resteAPayerEUR']);
          // print(data['lieuDepart']);
          // print(data['lieuDestination']);

          print("PAIEMENT LIST");
          // for( var item in paymentList) {
          //   print(item.reference);
          //   print(item.datePaiement);
          //   print('AMPVONY');
          //   print(item.montantEUR);
          //   print(item.montantMGA);
          //   print(item.modePaiement);
        
          // }
      
          print("******** TAFIDIIIIIIIIIIIITRA ATOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO ********");
          print('REF');
          print(data['reference']);
          print('DATE'); 
          print(data['datePaiement']); 
          print('EURO');    
          print(data['montantEUR']);
          print('MGA'); 
          print(data['montantMGA']);
          print('MODE'); 
          print(data['modePaiement']);

      
      
          print('///////////////////// OKOKOOKOKOKOKOKOKOKOKOKOKKOKOKOKOKOK');
          

          print ("AVANT *********************");
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
           print(' --------------- CODERETOUR = '+jsonData['CodeRetour']+' ---------------');
        }
      }else{
        var statuscode = (response.statusCode).toString() ;
        print(' ---------------- RESPONSE CODE ='+ statuscode + ' ---------------');
      }
    } catch (e) {
      print('CATCH');
      print(e);
    }
    
    throw Exception('Failed to fetch package details');
  }


  Future<List<ColisModel>> articleList(String reference) async {
    List<ColisModel> colisList = [];
    
    try{
      print("getToken");
      String token = await Util.getToken();
      
      print(token);
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
          print('200');
          print(data);
          print('LISTE JSON');
          print(data['Data']);

          List<dynamic> lisitra = data['Data']['colis'];

          print('PRINT LISITRA');
          print(lisitra);

          for( var item in lisitra) {
            print('ITEM');
            Map<String, dynamic> itemMap = Map<String, dynamic>.from(item.cast<String, dynamic>());
            print(itemMap);
            print('PM - Standard');
            ColisModel pm = ColisModel.fromJson(itemMap);
            print(pm);
            colisList.add(pm);
          }
          print('COLIS');
          print(colisList);

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
        print('CATCH');
        print(e);
      // Gérer toutes les autres exceptions ici
       throw ApiException("Erreur venant du serveur");
     }
 
  }


   Future<List<PaymentModel>> paymentList(String reference) async {
    List<PaymentModel> paymentList = [];
    
    try{
      print("getToken");
      String token = await Util.getToken();
      
      print(token);
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
          print('200');
          print(data);
          print('LISTE JSON');
          print(data['Data']);

          List<dynamic> liste = data['Data']['paiements'];

          print('PRINT LISTE');
          print(liste);

          for( var item in liste) {
            print('ITEM');
            Map<String, dynamic> itemMap = Map<String, dynamic>.from(item.cast<String, dynamic>());
            print(itemMap);
            print('PM - Standard');
            PaymentModel pmt = PaymentModel.fromJson(itemMap);
            print(pmt);
            paymentList.add(pmt);
          }
          print('PAIEMENT');
          print(paymentList);

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
        print('CATCH');
        print(e);
      // Gérer toutes les autres exceptions ici
       throw ApiException("Erreur venant du serveur");
     }
 
  }




}

