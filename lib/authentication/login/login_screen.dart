import 'package:flutter/material.dart';

enum LogInButtonAction { login, register, passwordReset }

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(children: <Widget>[
          _buildTextFields(),
          SizedBox(height: 50),
          _buildButtons(),
        ]),
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
