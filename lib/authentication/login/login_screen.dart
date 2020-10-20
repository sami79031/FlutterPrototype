import 'package:flutter/material.dart';
import 'package:mall_prototype/app/app_routes.dart';
import 'package:mall_prototype/resources/login_strings.dart';
import 'models/login_view_model.dart';

enum LogInButtonAction { login, register, passwordReset }

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<LoginView> {
  LoginViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = LoginViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(children: <Widget>[
            SizedBox(height: 50),
            _buildTextFields(),
            SizedBox(height: 50),
            _buildButtons(),
          ])),
    );
  }

  Widget _userNameStream() {
    return StreamBuilder<String>(
      stream: _viewModel.getLoginFormObserver().userNameErrorText,
      builder: (context, snapshot) {
        return Container(
          child: TextField(
            key: Key("user_name"),
            decoration: InputDecoration(
              labelText: LoginStrings.USER_NAME_LABEL,
              hintText: LoginStrings.USER_NAME_LABEL_HINT,
              errorText: snapshot.data,
            ),
            controller: _viewModel.userNameController,
          ),
        );
      },
    );
  }

  Widget _buildTextFields() {
    return Container(
      child: Column(
        children: <Widget>[
          _userNameStream(),
          Container(
            child: TextField(
              //controller: _passwordFilter,
              decoration: InputDecoration(labelText: LoginStrings.USER_PASSWORD_LABEL),
              controller: _viewModel.userPasswordController,
              obscureText: true,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Container(
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text(LoginStrings.LOGIN_BUTTON),
            onPressed: () => onButtonPressed(LogInButtonAction.login),
          ),
          FlatButton(
            key: Key("register"),
            child: Text(
              LoginStrings.SIGNUP_BUTTON,
              textAlign: TextAlign.center,
            ),
            onPressed: () => onButtonPressed(LogInButtonAction.register),
          ),
          FlatButton(
            child: Text(LoginStrings.FORGOT_PASSWORD),
            onPressed: () => onButtonPressed(LogInButtonAction.passwordReset),
          )
        ],
      ),
    );
  }

  void onButtonPressed(LogInButtonAction action) {
    if (action == LogInButtonAction.login) {
      _viewModel.checkLogin();
    } else if (action == LogInButtonAction.register) {
      Navigator.pushNamed(context, AppRoutes.APP_ROUTE_SIGNUP);
    }
  }
}
