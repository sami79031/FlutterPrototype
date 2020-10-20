import 'dart:async';
import 'package:mall_prototype/authentication/login/login/login_error_types.dart';
import 'package:mall_prototype/authentication/login/login/login_static.dart';

abstract class LoginFormObserverContract {
  Sink get userName;

  Sink get userPassword;

  Stream<String> get userNameErrorText;

  Stream<String> get _isValidUserName;

  Stream<String> get userPasswordErrorText;

  Stream<String> get _isValidPassword;

  String _checkValidUserName(String password);

  String _checkValidPassword(String password);

  void _handleLoginEnableProcess();

  void dispose();
}

class LoginFormObserver extends LoginFormObserverContract {
  var _userNameController = StreamController<String>.broadcast();
  var _userPasswordController = StreamController<String>.broadcast();
  var _userNameErrorMsgController = StreamController<String>.broadcast();
  var _userPasswordErrorMsgController = StreamController<String>.broadcast();

  LoginFormObserver() : super() {
    _handleLoginEnableProcess();
  }

  @override
  void dispose() {
    _userNameController.close();
    _userPasswordController.close();
    _userNameErrorMsgController.close();
    _userPasswordErrorMsgController.close();
  }

  @override
  Sink get userName => _userNameController;

  @override
  Sink get userPassword => _userPasswordController;

  @override
  Stream<String> get userNameErrorText => _userNameErrorMsgController.stream;

  @override
  Stream<String> get _isValidUserName => _userNameController.stream
      .skip(LoginRequirements.USER_NAME_VALID_LENGTH)
      .map((_checkValidUserName));

  @override
  void _handleLoginEnableProcess() {
    _isValidUserName.listen((result) {
      _userNameErrorMsgController.add(result);
    });

    _isValidPassword.listen((result) {
      _userPasswordErrorMsgController.add(result);
    });
  }

  @override
  String _checkValidUserName(String userName) {
    if (userName == null || userName.isEmpty)
      return LoginErrorMessage.userNameNull.value;

    if (userName.length < LoginRequirements.USER_NAME_VALID_LENGTH)
      return LoginErrorMessage.userNameMinimumCharacters.value;

    if (!_validateEmail(userName))
      return LoginErrorMessage.userNameFormat.value;

    return null;
  }

  bool _validateEmail(String value) {
    Pattern pattern = LoginRequirements.USERNAME_REGEX;
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  @override
  String _checkValidPassword(String password) {
    if (password.length < LoginRequirements.USER_PASSWORD_VALID_LENGTH)
      return LoginErrorMessage.userPasswordLength.value;

    return null;
  }

  @override
  Stream<String> get _isValidPassword => _userPasswordController.stream
      .skip(3)
      .map((_checkValidPassword));

  @override
  Stream<String> get userPasswordErrorText => _userPasswordErrorMsgController.stream;


}
