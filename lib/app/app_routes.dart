import 'package:flutter/material.dart';
import 'package:mall_prototype/authentication/login/login_screen.dart';
import 'package:mall_prototype/authentication/login/signup_screen.dart';

class AppRoutes {
  static const String APP_ROUTE_LOGIN = "/";
  static const String APP_ROUTE_SIGNUP = "/signup";

  Route getRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case APP_ROUTE_LOGIN:
        return factorRoute(routeSettings, LoginScreen(), true);
      case APP_ROUTE_SIGNUP:
        return factorRoute(routeSettings, SignUpScreen(), true);
    }

    return null;
  }

  MaterialPageRoute factorRoute(
      RouteSettings routeSettings, Widget widget, bool isFullScreen) {

    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) => widget,
      fullscreenDialog: isFullScreen,
    );
  }
}
