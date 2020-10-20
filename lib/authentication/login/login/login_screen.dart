import 'package:flutter/material.dart';
import 'package:mall_prototype/app/app_routes.dart';
import 'package:mall_prototype/resources/login_strings.dart';
import '../models/login_view_model.dart';

enum LogInButtonAction { login, register, passwordReset }

class LoginScreen extends StatefulWidget {
  @override
  _LoginFormController createState() => _LoginFormController();
}

class _LoginFormController extends State<LoginScreen> {

  LoginViewModel _viewModel;
  bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    _viewModel = LoginViewModel();
  }

  @override
  Widget build(BuildContext context) => LoginView(this, _viewModel);

  void onButtonPressed(LogInButtonAction action) {
    if (action == LogInButtonAction.login) {
      _viewModel.checkLogin();
    } else if (action == LogInButtonAction.register) {
      Navigator.pushNamed(context, AppRoutes.APP_ROUTE_SIGNUP);
    }
  }

  void setPasswordVisible() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }
}

class LoginView extends StatelessWidget {

  final _LoginFormController state;
  LoginScreen get widget => state.widget;
  final LoginViewModel _viewModel;

  LoginView(this.state,this._viewModel, {Key key}) : super(key: key);

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
          child: TextFormField(
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

  Widget _passwordWidget() {
    return Container(
      height: 65,
      child: TextFormField(
        //controller: _passwordFilter,
        decoration: InputDecoration(
          labelText: LoginStrings.USER_PASSWORD_LABEL,
          hintText: LoginStrings.USER_PASSWORD_HINT,
          suffix: IconButton(
            icon: Icon(
                state._passwordVisible ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              state.setPasswordVisible();
            },
          ),
        ),
        controller: _viewModel.userPasswordController,
        obscureText: !state._passwordVisible,
      ),
    );
  }

  Widget _buildTextFields() {
    return Container(
      child: Column(
        children: <Widget>[_userNameStream(), _passwordWidget()],
      ),
    );
  }

  Widget _buildButtons() {
    return Container(
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text(LoginStrings.LOGIN_BUTTON),
            onPressed: () => state.onButtonPressed(LogInButtonAction.login),
          ),
          FlatButton(
            key: Key("register"),
            child: Text(
              LoginStrings.SIGNUP_BUTTON,
              textAlign: TextAlign.center,
            ),
            onPressed: () => state.onButtonPressed(LogInButtonAction.register),
          ),
          FlatButton(
            child: Text(LoginStrings.FORGOT_PASSWORD),
            onPressed: () => state.onButtonPressed(LogInButtonAction.passwordReset),
          )
        ],
      ),
    );
  }

}
