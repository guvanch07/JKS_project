import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:presentation/screen/login/main_login.dart';

void main() {
  testWidgets("login_tester", (WidgetTester tester) async {
    final loginTextField = find.byKey(ValueKey("login"));
    final passwordTextField = find.byKey(ValueKey("password"));
    final loginButton = find.byKey(ValueKey("login_button"));

    await tester.pumpWidget(LoginPage());
    await tester.enterText(loginTextField, "testing");
    await tester.enterText(passwordTextField, "testing");
    await tester.tap(loginButton);
    await tester.pump(); //! rebuilds widgets

    expect(find.text("testing"), findsWidgets);
  });
}
