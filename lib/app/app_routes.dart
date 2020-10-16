
import 'package:flutter/material.dart';
import 'package:mall_prototype/authentication/login/login_screen.dart';

class AppRoutes {

  static const String APP_ROUTE_LOGIN = "/login";

  Route getRoutes(RouteSettings routeSettings){

    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) => LoginScreen(),
      fullscreenDialog: true,
    );
  }
}