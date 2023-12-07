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

}