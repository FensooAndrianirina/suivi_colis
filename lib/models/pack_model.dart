import 'package:flutter/material.dart';
import 'package:client_apk/models/colis_model.dart';
import 'package:client_apk/models/payment_model.dart';
import 'package:intl/intl.dart';


class PackModel {
  String reference;

  String expediteur;
  String destinataire;

  double tarifEnvoiEUR;
  double tarifExtraEUR;
  double resteAPayerEUR;

  int? nbreColis;

  String lieuDepart;
  String lieuDestination;

  DateTime? dateExpedition;
  DateTime? dateArrivee;
  DateTime? dateLivraison;

  int? expediteur_id;
  int? destinataire_id;

  List<ColisModel> colis;

  String contactExpediteur;
  String contactDestinataire;
  String? recuperateur;

  List<PaymentModel> paiements;
  

  PackModel({
    required this.reference,

    required this.expediteur,
    required this.destinataire,

    required this.tarifEnvoiEUR,
    required this.tarifExtraEUR,
    required this.resteAPayerEUR,

    this.nbreColis,

    required this.lieuDepart,
    required this.lieuDestination,

    this.dateExpedition,
    this.dateArrivee,
    this.dateLivraison,

    this.expediteur_id,
    this.destinataire_id,

    required this.colis,

    required this.contactExpediteur,
    required this.contactDestinataire,
    this.recuperateur,

    required this.paiements,


  });


  // factory PackModel.fromJson(Map<String, dynamic> json) {
  //   final List<dynamic> colisData = json['colis'] ?? [];
  //   final List<ColisModel> colisList = colisData.map((item) => ColisModel.fromJson(item)).toList();

  //   return PackModel(
  //     reference: json['reference'],

  //     expediteur: json['expediteur'],
  //     destinataire: json['destinataire'],

  //     tarifEnvoiEUR: json['tarifEnvoiEUR'] ?? 0.0,
  //     tarifExtraEUR:  json['tarifExtraEUR'] ?? 0.0,
  //     resteAPayerEUR: json['resteAPayerEUR'] ?? 0.0,

  //     lieuDepart: json['lieuDepart'],
  //     lieuDestination: json['lieuDestination'],

  //     dateExpedition: json['dateExpedition'] != null ? DateTime.parse(json['dateExpedition']) : null,
  //     dateArrivee: json['dateArrivee'] != null ? DateTime.parse(json['dateArrivee']) : null,
  //     dateLivraison: json['dateLivraison'] != null ? DateTime.parse(json['dateLivraison']) : null,
  //     // dateArrivee: DateTime.parse(json['dateArrivee']),

  //     colis: colisList,
  //   );
  // }
}