import 'package:flutter/material.dart';

import 'package:presentation/core/helpers/primary_button.dart';
import 'package:presentation/pages/card/card_main.dart';
import 'package:presentation/widgets/text_field.dart';

part 'login_widgets.dart';

class LoginPageWithKey extends StatefulWidget {
  const LoginPageWithKey({Key? key}) : super(key: key);

  @override
  State<LoginPageWithKey> createState() => _LoginPageWithKeyState();
}

class _LoginPageWithKeyState extends State<LoginPageWithKey> {
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Form(
        key: formkey,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const _LoginEmailWithKey(),
            const SizedBox(height: 20),
            const _LoginPasswordWithKey(),
            const Spacer(),
            _LoginButtonWithKey(formkey: formkey)
          ],
        ),
      ),
    ));
  }
}
