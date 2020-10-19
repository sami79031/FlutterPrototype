
import 'package:flutter/material.dart';
import 'package:mall_prototype/authentication/login/login_screen.dart';
import 'package:mall_prototype/authentication/login/signup_screen.dart';

class AppRoutes {

  static const String APP_ROUTE_LOGIN = "/";
  static const String APP_ROUTE_SIGNUP = "/signup";

  Route getRoutes(RouteSettings routeSettings) {

    switch(routeSettings.name) {
      case APP_ROUTE_LOGIN:
        return loginScreen(routeSettings);
      case APP_ROUTE_SIGNUP:
        return signUpScreen(routeSettings);
    }
  }

  MaterialPageRoute loginScreen(RouteSettings routeSettings) {
    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) => LoginScreen(),
      fullscreenDialog: true,
    );
  }

  MaterialPageRoute signUpScreen(RouteSettings routeSettings) {
    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) => SignUpScreen(),
      fullscreenDialog: true,
    );
  }

}