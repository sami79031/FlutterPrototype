import 'dart:async';

abstract class LoginFormObserverContract {

  Sink get userName;
  Sink get userPassword;

  Stream<String> get userNameErrorText;
  Stream<String> get _isValidUserName;

  String _checkValidUserName(String userName);
  void _handleLoginEnableProcess();

  void dispose();

}

class LoginFormObserver extends LoginFormObserverContract {
  static const int USER_NAME_VALID_LENGTH = 3;
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
  Stream<String> get _isValidUserName => _userNameController.stream.skip(USER_NAME_VALID_LENGTH)
      .map((_checkValidUserName));

  @override
  void _handleLoginEnableProcess() {
    _isValidUserName.listen( (result) {
      _userNameErrorMsgController.add(result);
    });
  }

  @override
  String _checkValidUserName(String userName) {
    if (userName == null || userName.isEmpty)
      return "Type in username";

    if (userName.length < USER_NAME_VALID_LENGTH)
      return "User name must be at least 3 characters";

    if (!_validateEmail(userName))
      return "Username is not in valid format";

    return null;
  }

  bool _validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

}