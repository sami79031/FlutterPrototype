import 'package:flutter/material.dart';
import 'package:mall_prototype/app/app.dart';

import 'models/login_view_model.dart';

enum LogInButtonAction { login, register, passwordReset }

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginView(),
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
    _viewModel = LoginViewModel(App());
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
          ]
          )
      ),
    );
  }

  Widget _userNameStream() {
    return StreamBuilder<String>(
        stream: _viewModel.getLoginFormObserver().userNameErrorText,
        builder: (context, snapshot) {
            return Container(
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'UserName',
                      hintText: "type user name",
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
              decoration: InputDecoration(labelText: 'Password'),
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
            child: Text('Login'),
            onPressed: () => onButtonPressed(LogInButtonAction.login),
          ),
          FlatButton(
            child: Text('Don\'t have an account? Tap here to register.'),
            onPressed: () => onButtonPressed(LogInButtonAction.register),
          ),
          FlatButton(
            child: Text('Forgot Password?'),
            onPressed: () => onButtonPressed(LogInButtonAction.passwordReset),
          )
        ],
      ),
    );
  }

  void onButtonPressed(LogInButtonAction action) {
    if (action == LogInButtonAction.login) {
      _viewModel.checkLogin();
    }
  }
}