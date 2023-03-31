import 'package:client_apk/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class LoginService {

   gethttp () async {
    final dio = Dio();
    print("ato");
    final response = await dio.get('https://reqres.in/api/users?page=2');
    return response;
    }
}