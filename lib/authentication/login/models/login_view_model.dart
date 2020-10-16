import 'package:flutter/material.dart';
import 'package:mall_prototype/authentication/login/observables/login_form_observers.dart';

class LoginViewModel {
  LoginFormObserver _loginFormObserver;
  LoginFormObserver getLoginFormObserver() => _loginFormObserver;
  final userNameController = TextEditingController();
  final userPasswordController = TextEditingController();

  LoginViewModel() {
    _loginFormObserver = LoginFormObserver();
    _init();
  }

  void _init() {
    userNameController.addListener(() =>
    // Add userNameController's value to userName SINK from LoginFormObserver
    getLoginFormObserver()
        .userName
        .add(userNameController.text));

    // Add listener to userPasswordController
    userPasswordController.addListener(() =>
    // Add userPasswordController's value to userPassword SINK from LoginFormObserver
    getLoginFormObserver()
        .userPassword
        .add(userPasswordController.text));
  }

  void checkLogin() {
    String userName = userNameController.text ?? "";
    String userPassword = userPasswordController.text ?? "";

    print("USERNAME $userName");
    print("PASSWORD $userPassword");
  }
}
