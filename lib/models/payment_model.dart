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
    return PaymentModel(
      reference: json['reference'],
      datePaiement: json['datePaiement'],

      montantEUR: json['montantEUR'] ?? 0,
      montantMGA: json['montantMGA'] ?? 0,
    
      modePaiement: json['modePaiement'],
      
    );
  }
} 