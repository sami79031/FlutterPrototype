import 'dart:async';

abstract class LoginFormObserverContract {
  Sink get userName;
  Sink get userPassword;


  void dispose();
}

