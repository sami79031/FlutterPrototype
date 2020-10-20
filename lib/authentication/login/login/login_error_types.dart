import 'login_static.dart';

enum LoginErrorMessage {
  userNameNull,
  userNameMinimumCharacters,
  userNameFormat
}

extension ErroeMessageExt on LoginErrorMessage {
  static const map = {
    LoginErrorMessage.userNameFormat: "Username is not in valid format",
    LoginErrorMessage.userNameMinimumCharacters:
    "User name must be at least ${LoginRequirements.USER_NAME_VALID_LENGTH} characters",
    LoginErrorMessage.userNameNull: "Type in username",
  };

  String get value => map[this];
}