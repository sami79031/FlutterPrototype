import 'package:flutter/material.dart';
import 'package:mall_prototype/resources/login_strings.dart';
import 'login_screen.dart';


class LoginView extends StatelessWidget {
  LoginView(this.state, {Key key}) : super(key: key);

  final LoginFormController state;
  LoginScreen get widget => state.widget;

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
      stream: state.viewModel.getLoginFormObserver().userNameErrorText,
      builder: (context, snapshot) {
        return Container(
          child: TextFormField(
            key: Key("user_name"),
            decoration: InputDecoration(
              labelText: LoginStrings.USER_NAME_LABEL,
              hintText: LoginStrings.USER_NAME_LABEL_HINT,
              errorText: snapshot.data,
            ),
            controller: state.viewModel.userNameController,
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
                state.passwordVisible ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              state.setPasswordVisible();
            },
          ),
        ),
        controller: state.viewModel.userPasswordController,
        obscureText: !state.passwordVisible,
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
