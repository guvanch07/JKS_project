import 'package:flutter/material.dart';
import 'package:presentation/base/bloc_state.dart';
import 'package:presentation/base/stream_platform_stack_content.dart';
import 'package:presentation/screen/home/home_tab_bar.dart';
import 'package:presentation/screen/login/bloc/login_bloc.dart';
import 'package:presentation/screen/login/bloc/login_data.dart';
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
        if (blocData.isLoading) {
          return const CircularProgressIndicator.adaptive();
        } else {
          final screenData = blocData.data;
          if (screenData is LoginData) {
            if (screenData.exception != null) {
              WidgetsBinding.instance?.addPostFrameCallback(
                (_) {
                  bloc.loginFormKey.currentState?.validate();
                  bloc.passwordFormKey.currentState?.validate();
                },
              );
            }
            if (screenData.loginInput.isNotEmpty &&
                screenData.passwordInput.isNotEmpty &&
                screenData.exception == null) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const HomeTabBar();
              }));
            }
            return LoginPageWithKey(
              onChangedEmail: bloc.setLogin,
              onChangedPassword: bloc.setPassword,
              keyLogin: bloc.loginFormKey,
              keyPassword: bloc.passwordFormKey,
              initialLogin: screenData.loginInput,
              initialPassword: screenData.passwordInput,
              onPressLogin: bloc.login,
              emailException: screenData.exception?.loginError,
              passwordException: screenData.exception?.passwordError,
            );
          }
        }
      },
    );
  }
}
