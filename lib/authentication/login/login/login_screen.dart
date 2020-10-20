import 'package:flutter/material.dart';
import 'package:mall_prototype/app/app_routes.dart';
import '../models/login_view_model.dart';
import 'login_view.dart';

enum LogInButtonAction { login, register, passwordReset }

class LoginScreen extends StatefulWidget {
  @override
  LoginFormController createState() => LoginFormController();
}

class LoginFormController extends State<LoginScreen> {

  LoginViewModel _viewModel;
  bool passwordVisible;

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
    _viewModel = LoginViewModel();
  }

  @override
  Widget build(BuildContext context) => LoginView(this, _viewModel);

  void onButtonPressed(LogInButtonAction action) {
    if (action == LogInButtonAction.login) {
      _viewModel.checkLogin();
    } else if (action == LogInButtonAction.register) {
      Navigator.pushNamed(context, AppRoutes.APP_ROUTE_SIGNUP);
    }
  }

  void setPasswordVisible() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }
}
