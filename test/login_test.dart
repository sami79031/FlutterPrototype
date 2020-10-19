// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mall_prototype/app/app.dart';
import 'package:mall_prototype/authentication/login/signup_screen.dart';


void main() {
  testWidgets('LoginScreen on tap `register` routes to `SignUpScreen`', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(App());

    await tester.tap(find.byKey(Key("register")));
    await tester.pumpAndSettle(Duration(seconds: 1));

    expect(find.byType(SignUpScreen), findsOneWidget);
  });
}
