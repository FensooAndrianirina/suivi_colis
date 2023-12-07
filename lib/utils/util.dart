import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:client_apk/models/user_model.dart';


class Util {
  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.get('token') != null && prefs.get("token").toString().isNotEmpty) { 
      return prefs.get("token") as String;
    } else {
      throw const HttpException("Unauthorized");
    }
  }

  static Future<UserModel> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.get('token') != null && prefs.get("token").toString().isNotEmpty) { 

      int id = prefs.getInt('id') ?? 0;
      String nom = prefs.getString('nom') ?? '';
      String email = prefs.getString('email') ?? '';
      String telephone = prefs.getString('tel') ?? '';
      String contact = prefs.getString('contact') ?? ''; 
      String facebook = prefs.getString('compteFB') ?? '';
      String whatsapp = prefs.getString('whatsapp') ?? '';
      String adresse = prefs.getString('adresse') ?? '';

      UserModel user = UserModel(email: email, name: nom, id: id, tel: telephone, address: adresse, whatsapp: whatsapp, contact: contact, fb: facebook);

      return user;
    } else {
    
      throw const HttpException("Unauthorized");
    }
  }
}