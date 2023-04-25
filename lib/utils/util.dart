import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class Util {
  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.get('token') != null && prefs.get("token").toString().isNotEmpty) { 
      return prefs.get("token") as String;
    } else {
      throw const HttpException("Unauthorized");
    }
  }
}