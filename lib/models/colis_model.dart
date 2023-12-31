import 'package:flutter/material.dart';


class ColisModel {
  String contenu;
  double volume;
  double? poids;
  double tarifEnvoiEUR; 
  int? nombre;
  int numeroColis;
  String referenceColis;

  ColisModel({
    required this.contenu,
    required this.volume,
    this.poids,
    required this.tarifEnvoiEUR,
    this.nombre,
    required this.numeroColis,
    required this.referenceColis,
  });

  factory ColisModel.fromJson(Map<String, dynamic> json) {
    return ColisModel(
      contenu: json['contenu'],
      volume: json['volume']  ?? 0,
      poids: json['poids'] ?? 0,
      tarifEnvoiEUR: json['tarifEnvoiEUR'] ?? 0,
      nombre: json['nombre'] ?? 0,
      numeroColis: json['numeroColis'] ?? 0,
      referenceColis: json['referenceColis'],
    );
  }
}