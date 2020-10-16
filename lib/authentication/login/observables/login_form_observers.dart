import 'dart:async';

abstract class LoginFormObserverContract {
  static const int USER_NAME_VALID_LENGTH = 3;

  Sink get userName;
  Sink get userPassword;

  Stream<String> get userNameErrorText;

  void dispose();

}

class LoginFormObserver extends LoginFormObserverContract {
  var _userNameController = StreamController<String>.broadcast();
  var _userPasswordController = StreamController<String>.broadcast();
  var _userNameErrorMsgController = StreamController<String>.broadcast();

  LoginFormObserver():super() {
    _handleLoginEnableProcess();
  }

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

  @override
  Stream<bool> get _isValidUserName => _userNameController.stream.skip(LoginFormObserverContract.USER_NAME_VALID_LENGTH)
      .map((_checkValidUserName));

  @override
  void _handleLoginEnableProcess() {
    _isValidUserName.listen( (isValidUserName) {
        if (isValidUserName) {
          _userNameErrorMsgController.add(null);
        } else {
          _userNameErrorMsgController.add("User name must be at least 3 characters");
        }
    });
  }

  @override
  bool _checkValidUserName(String userName) => userName != null && userName.length >= LoginFormObserverContract.USER_NAME_VALID_LENGTH;


}