import 'package:flutter/material.dart';


class PaymentModel{

  String reference;

  double? montantEUR;
  double? montantMGA;

  DateTime? datePaiement;
  String? modePaiement;

  PaymentModel({
    required this.reference,
    this.datePaiement,

    this.montantEUR,
    this.montantMGA,

    this.modePaiement,

  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    
    print("json");
    print(json);

    return PaymentModel(
      reference: json['reference'],
      // datePaiement: DateTime.parse(json['datePaiement']),
      datePaiement: json['datePaiement'],

      montantEUR: json['montantEUR'] ?? 0,
      montantMGA: json['montantMGA'] ?? 0,
    
      modePaiement: json['modePaiement'],
      
    );


    // return PaymentModel(
    //   reference: json['test'],
    //   // datePaiement: DateTime.parse(json['datePaiement']),
    //   datePaiement: json['22/05/2023'],

    //   montantEUR: json['20.0'],
    //   montantMGA: json['40.0'] ?? 0,
    
    //   modePaiement: json['Carte bancaire'],
      
    // );
  }
} 