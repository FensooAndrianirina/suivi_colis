import 'package:flutter/material.dart';


class UserModel{
  String? email;
  String? name;
  String? id;
  String? tel;
  String? address;
  String? fb;
  String? etat;
  String? token;

  UserModel({
    required this.email, 
    required this.name, 
    required this.id,
    required this.tel,
    this.address,
    this.fb,
    required this.etat
  });

  UserModel.login(String email,  String token){
    this.email = email;
    this.token = token;

  }
}