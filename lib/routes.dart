import 'package:client_apk/views/listScreen.dart';
import 'package:client_apk/views/loginScreen.dart';
import 'package:client_apk/views/detailScreen.dart';
import 'package:client_apk/views/ChangePassword.dart';
import 'package:client_apk/views/signinScreen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String list = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String detail = '/detail';
  static const String changePass = '/changePass';

  static final Map<String, WidgetBuilder> routes = {
    list: (context) => const ListScreen(),
    detail: (context) => const DetailScreen(),
    login: (context) => LoginScreen(),
    register: (context) => SigninScreen(),
    changePass: (context) => ChangePassword(),
  };
}
