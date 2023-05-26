import 'package:flutter/material.dart';
import 'package:client_apk/models/colis_model.dart';


class PackageModel{
  String reference;
  String expediteur;
  String destinataire;
  String lieuDepart;
  String lieuDestination;
  int nbreColis;
  DateTime dateCreation;
  DateTime dateEnvoi;
  String moyenExpedition;
  String typeReception;
  String typeEnvoi;
  double? tarifEnvoiEUR;
  double? tarifExtraEUR;
  double? resteAPayerEUR;
  String? descTarifExtra;
  double? tauxDeChange;
  int expediteur_id;
  int destinataire_id;

  // List<ColisModel> colis;

  PackageModel({
    required this.reference,
    required this.expediteur,
    required this.destinataire,
    required this.lieuDepart,
    required this.lieuDestination,
    required this.nbreColis,
    required this.dateCreation,
    required this.dateEnvoi,
    required this.moyenExpedition,
    required this.typeReception,
    required this.typeEnvoi,
    this.tarifEnvoiEUR,
    this.tarifExtraEUR,
    this.resteAPayerEUR,
    this.descTarifExtra,
    this.tauxDeChange,
    required this.expediteur_id,
    required this.destinataire_id,
    // required this.colis,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) {
    
    print("json");
    print(json);

    // List<dynamic> colisData = json['colis'];
    // List<ColisModel> colisList =
    // colisData.map((item) => ColisModel.fromJson(item)).toList();


    // return PackageModel(
    //   reference: "test",
    //   expediteur: "test",
    //   destinataire: "test",
    //   lieuDepart: "test",
    //   lieuDestination: json['lieuDestination'],
    //   nbreColis: 2,
    //   dateCreation: DateTime.parse(json['dateCreation']),
    //   dateEnvoi: DateTime.parse(json['dateEnvoi']),
    //   moyenExpedition: json['moyenExpedition'],
    //   typeReception: json['typeReception'],
    //   typeEnvoi: json['typeEnvoi'],
    //   tarifEnvoiEUR: 3,
    //   tarifExtraEUR:  3,
    //   resteAPayerEUR: 3,
    //   descTarifExtra: json['descTarifExtra'],
    //   tauxDeChange: 3,
    //   expediteur_id: 2,
    //   destinataire_id: 2,
      
    // );

    return PackageModel(
      reference: json['reference'],
      expediteur: json['expediteur'],
      destinataire: json['destinataire'],
      lieuDepart: json['lieuDepart'],
      lieuDestination: json['lieuDestination'],
      nbreColis: json['nbreColis'],
      dateCreation: DateTime.parse(json['dateCreation']),
      dateEnvoi: DateTime.parse(json['dateEnvoi']),
      moyenExpedition: json['moyenExpedition'],
      typeReception: json['typeReception'],
      typeEnvoi: json['typeEnvoi'],
      tarifEnvoiEUR: json['tarifEnvoiEUR'] ?? 0,
      tarifExtraEUR:  json['tarifExtraEUR'] ?? 0,
      resteAPayerEUR: json['resteAPayerEUR'] ?? 0 ,
      descTarifExtra: json['descTarifExtra'],
      tauxDeChange: json['tauxDeChange'] ?? 0,
      expediteur_id: json['expediteur_id'],
      destinataire_id: json['destinataire_id'],   
      // colis: json['colis']
      
    );
  }
} 