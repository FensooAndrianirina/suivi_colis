import 'package:flutter/material.dart';
import 'package:client_apk/models/colis_model.dart';

class PackModel {
  String reference;
  String expediteur;
  String destinataire;
  double tarifEnvoiEUR;
  double tarifExtraEUR;
  double resteAPayerEUR;
  List<ColisModel> colis;

  PackModel({
    required this.reference,
    required this.expediteur,
    required this.destinataire,
    required this.tarifEnvoiEUR,
    required this.tarifExtraEUR,
    required this.resteAPayerEUR,
    required this.colis,
  });

  factory PackModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> colisData = json['colis'] ?? [];
    final List<ColisModel> colisList = colisData.map((item) => ColisModel.fromJson(item)).toList();

    return PackModel(
      reference: json['reference'],
      expediteur: json['expediteur'],
      destinataire: json['destinataire'],
      tarifEnvoiEUR: json['tarifEnvoiEUR'],
      tarifExtraEUR: json['tarifExtraEUR'],
      resteAPayerEUR: json['resteAPayerEUR'],
      colis: colisList,
    );
  }
}