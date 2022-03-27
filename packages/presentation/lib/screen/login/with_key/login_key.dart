import 'package:flutter/material.dart';

import 'package:presentation/core/helpers/primary_button.dart';
import 'package:presentation/widgets/text_field.dart';

part 'login_widgets.dart';

class LoginPageWithKey extends StatefulWidget {
  const LoginPageWithKey({Key? key}) : super(key: key);

  @override
  State<LoginPageWithKey> createState() => _LoginPageWithKeyState();
}

class _LoginPageWithKeyState extends State<LoginPageWithKey> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Map<String, String> formfield = <String, String>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Form(
        key: formkey,
        child: Column(
          children: [
            const SizedBox(height: 20),
            _LoginEmailWithKey(textField: formfield),
            const SizedBox(height: 20),
            _LoginPasswordWithKey(textField: formfield),
            const Spacer(),
            _LoginButtonWithKey(formkey: formkey, textField: formfield)
          ],
        ),
      ),
    ));
  }
}
