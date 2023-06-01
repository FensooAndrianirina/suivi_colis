import 'package:flutter/material.dart';


class UserModel{
  String? email;
  String? name;
  int? id;
  String? tel;
  String? address;
  String? fb;
  String? whatsapp;
  String? contact;
  String? token;

  UserModel({
    required this.email, 
    required this.name, 
    required this.id,
    required this.tel,
    this.address,
    this.whatsapp,
    required this.contact,   
    this.fb,
  });

  UserModel.login(String email,  String token){
    this.email = email;
    this.token = token;

  }
}