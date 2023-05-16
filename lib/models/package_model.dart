import 'package:flutter/material.dart';


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
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) {
    
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
      tarifEnvoiEUR: json['tarifEnvoiEUR'] ?? null,
      tarifExtraEUR:  json['tarifExtraEUR'] ?? null,
      resteAPayerEUR: json['resteAPayerEUR'] ?? null,
      descTarifExtra: json['descTarifExtra'],
      tauxDeChange: json['tauxDeChange'],
      expediteur_id: json['expediteur_id'],
      destinataire_id: json['destinataire_id'],
    );
  }
}