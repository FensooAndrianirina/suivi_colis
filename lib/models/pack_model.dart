import 'package:flutter/material.dart';
import 'package:client_apk/models/colis_model.dart';
import 'package:intl/intl.dart';


class PackModel {
  String reference;

  String expediteur;
  String destinataire;

  double tarifEnvoiEUR;
  double tarifExtraEUR;
  double resteAPayerEUR;

  String lieuDepart;
  String lieuDestination;

  DateTime? dateExpedition;
  DateTime? dateArrivee;
  DateTime? dateLivraison;

  List<ColisModel> colis;

  PackModel({
    required this.reference,

    required this.expediteur,
    required this.destinataire,

    required this.tarifEnvoiEUR,
    required this.tarifExtraEUR,
    required this.resteAPayerEUR,

    required this.lieuDepart,
    required this.lieuDestination,

    this.dateExpedition,
    this.dateArrivee,
    this.dateLivraison,

    required this.colis,
  });


  factory PackModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> colisData = json['colis'] ?? [];
    final List<ColisModel> colisList = colisData.map((item) => ColisModel.fromJson(item)).toList();

    return PackModel(
      reference: json['reference'],

      expediteur: json['expediteur'],
      destinataire: json['destinataire'],

      tarifEnvoiEUR: json['tarifEnvoiEUR'] ?? 0.0,
      tarifExtraEUR:  json['tarifExtraEUR'] ?? 0.0,
      resteAPayerEUR: json['resteAPayerEUR'] ?? 0.0,

      lieuDepart: json['lieuDepart'],
      lieuDestination: json['lieuDestination'],

      dateExpedition: json['dateExpedition'] != null ? DateTime.parse(json['dateExpedition']) : null,
      dateArrivee: json['dateArrivee'] != null ? DateTime.parse(json['dateArrivee']) : null,
      dateLivraison: json['dateLivraison'] != null ? DateTime.parse(json['dateLivraison']) : null,
      // dateArrivee: DateTime.parse(json['dateArrivee']),

      colis: colisList,
    );
  }
}