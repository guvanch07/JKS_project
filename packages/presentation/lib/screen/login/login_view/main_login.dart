import 'package:flutter/material.dart';
import 'package:presentation/base/bloc_state.dart';
import 'package:presentation/base/stream_platform_stack_content.dart';
import 'package:presentation/screen/login/bloc/login_bloc.dart';
import 'package:presentation/screen/login/login_view/login_key.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BlocState<LoginPage, LoginBloc> {
  @override
  void initState() {
    super.initState();
    bloc.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamPlatformStackContent(
        dataStream: bloc.dataStream,
        children: (blocData) {
          return LoginPageWithKey(
            validateEmail: (value) => bloc.validateTextEmail(value ?? ''),
            validatePassword: (value) => bloc.validateTextPassword(value ?? ''),
            onChangedEmail: bloc.setLogin,
            onChangedPassword: bloc.setPassword,
            onPressLogin: bloc.login,
            keyStore: bloc.keyStore,
            textField: bloc.onSave,
          );
        });
  }
}
