import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mall_prototype/authentication/login/observables/login_form_observers.dart';

class LoginViewModel implements LoginFormObserverContract {
  var _userNameTextController = StreamController<String>.broadcast();
  var _passwordTextController = StreamController<String>.broadcast();

  @override
  void dispose() {
    _userNameTextController.close();
    _passwordTextController.close();
  }

  @override
  Sink get userName => _userNameTextController;

  @override
  // TODO: implement userPassword
  Sink get userPassword => _passwordTextController;

  void checkLogin({@required String userName, @required String userPassword}) {
    print("USERNAME $userName");
    print("PASSWORD $userPassword");
  }
}
