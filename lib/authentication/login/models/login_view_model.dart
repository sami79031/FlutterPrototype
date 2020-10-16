import 'package:flutter/material.dart';
import 'package:mall_prototype/app/app.dart';
import 'package:mall_prototype/authentication/login/observables/login_form_observers.dart';

class LoginViewModel {
  LoginFormObserver _loginFormObserver;
  LoginFormObserver getLoginFormObserver() => _loginFormObserver;
  final userNameController = TextEditingController();
  final userPasswordController = TextEditingController();

  static LoginViewModel _instance;

  LoginViewModel._internal({ @required LoginFormObserver loginFormObserver }){
    _loginFormObserver = loginFormObserver;
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

  factory LoginViewModel(App app){
    // Check whether instance is NULL otherwise get the instance from private constructor
    _instance
    ??= // NULL Check
    // _instance is NULL. Create instance by injecting dependency to private internal constructor.
    LoginViewModel._internal(loginFormObserver: LoginFormObserver());
    // Return Singleton-Instance of LoginViewModel
    return _instance;
  }

  void checkLogin({@required String userName, @required String userPassword}) {
    print("USERNAME $userName");
    print("PASSWORD $userPassword");
  }
}
