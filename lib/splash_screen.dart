

import 'dart:async';

import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/app_routes.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: SplashView(),
      onGenerateRoute: AppRoutes().getRoutes,
    );
  }
}

class SplashView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashState();
}

class SplashState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  var _iconAnimationController;
  var _iconAnimation;

  startTimeout() async {
    return Timer(const Duration(seconds: 3), handleTimeout);
  }

  void handleTimeout()async {
    Navigator.pushReplacementNamed(context, AppRoutes.APP_ROUTE_LOGIN);
    // Use when there are preferences
    //await App().getAppPreferences().isPreferenceReady;
    //
    // App().getAppPreferences().getLoggedIn().then((isLoggedIn) {
    //   isLoggedIn
    //       ? Navigator.pushReplacementNamed(context, AppRoutes.APP_ROUTE_LOGIN)
    //       : Navigator.pushReplacementNamed(context, AppRoutes.APP_ROUTE_SIGNUP);
    // });
  }

  @override
  void initState() {
    super.initState();

    _iconAnimationController = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);

    _iconAnimation = CurvedAnimation(parent: _iconAnimationController, curve: Curves.fastOutSlowIn);
    _iconAnimation.addListener(() => this.setState(() {}));

    _iconAnimationController.forward();

    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: Center(
          child: Image(
            image: AssetImage("images/logo.png"),
            width: _iconAnimation.value * 180,
            height: _iconAnimation.value * 180,
          )),
    );
  }
}
