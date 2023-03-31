import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class TokenRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  final SharedPreferences preferences;

  TokenRouteObserver(this.preferences);

  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    final String? token = preferences.getString('token');
    if(token == null || token.isEmpty) {
      Navigator.pushAndRemoveUntil(
        route.settings as BuildContext,
        ModalRoute.withName('/login') as Route<Object?>,
        (route) => false,
      );
    }
  }
}