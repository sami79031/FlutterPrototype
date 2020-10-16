import 'dart:async';

abstract class LoginFormObserverContract {
  Sink get userName;
  Sink get userPassword;

  Stream<String> get userNameErrorText;

  void dispose();

}

class LoginFormObserver extends LoginFormObserverContract {
  var _userNameController = StreamController<String>.broadcast();
  var _userPasswordController = StreamController<String>.broadcast();
  var _userNameErrorMsgController = StreamController<String>.broadcast();

  LoginFormObserver():super();

  @override
  void dispose() {
      _userNameController.close();
      _userPasswordController.close();
      _userNameErrorMsgController.close();
  }

  @override
  Sink get userName => _userNameController;

  @override
  Sink get userPassword => _userPasswordController;

  @override
  Stream<String> get userNameErrorText => _userNameErrorMsgController.stream;

}