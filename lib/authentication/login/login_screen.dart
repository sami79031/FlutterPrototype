import 'package:flutter/material.dart';

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

  Widget _buildTextFields() {
    return Container(
      child: Column(
        children: <Widget>[
          new Container(
            child: TextField(
              //controller: _emailFilter,
              decoration: InputDecoration(labelText: 'Email'),
            ),
          ),
          new Container(
            child: TextField(
              //controller: _passwordFilter,
              decoration: InputDecoration(labelText: 'Password'),
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
    print(action);
  }
}