import 'package:domain/features/login/repository/validate_impl.dart';
import 'package:flutter/material.dart';
import 'package:presentation/core/helpers/primary_button.dart';
import 'package:presentation/features/card/pages/card_main.dart';
import 'package:presentation/features/login/bloc/provider.dart';
import 'package:presentation/features/login/widgets/text_field.dart';
part 'login_part.dart';


//! single global instance
final RegistrationImpl _registrationImpl = RegistrationImpl();

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
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
