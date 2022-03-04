import 'package:data/repository/login/login_impl.dart';
import 'package:data/repository/login/login_impl.dart';
import 'package:flutter/material.dart';
import 'package:presentation/core/helpers/primary_button.dart';
import 'package:presentation/pages/card/card_main.dart';
import 'package:presentation/widgets/text_field.dart';
part 'login_part.dart';

final RegistrationImpl bloc = RegistrationImpl();

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          _EmailStream(register: bloc),
          _PasswordStream(register: bloc),
          const Spacer(),
          _ButtonStream(register: bloc),
        ],
      ),
    ));
  }
}
