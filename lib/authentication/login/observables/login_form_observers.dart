import 'dart:async';

abstract class LoginFormObserverContract {
  Sink get userName;
  Sink get userPassword;


  void dispose();
}

class LoginFormObserver extends LoginFormObserverContract {
  var _userNameController = StreamController<String>.broadcast();
  var _userPasswordController = StreamController<String>.broadcast();

  LoginFormObserver():super();

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  // TODO: implement userName
  Sink get userName => throw UnimplementedError();

  @override
  // TODO: implement userPassword
  Sink get userPassword => throw UnimplementedError();


}