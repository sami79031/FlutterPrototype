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
      _userNameController.close();
      _userPasswordController.close();
  }

  @override
  Sink get userName => _userNameController;

  @override
  // TODO: implement userPassword
  Sink get userPassword => _userPasswordController;


}