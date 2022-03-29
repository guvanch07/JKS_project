import 'package:flutter/material.dart';
import 'package:presentation/base/bloc_data.dart';
import 'package:presentation/base/bloc_state.dart';
import 'package:presentation/base/stream_platform_stack_content.dart';
import 'package:presentation/core/helpers/primary_button.dart';
import 'package:presentation/navigator/base_argumaents.dart';
import 'package:presentation/navigator/base_page.dart';
import 'package:presentation/screen/login/bloc/login_bloc.dart';
import 'package:presentation/widgets/text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const String _login = "Login";
const String _password = "Password";

class LoginPage extends StatefulWidget {
  static const routeName = '/LoginPage';

  static BasePage page({BaseArguments? arguments}) => BasePage(
        key: const ValueKey(routeName),
        name: routeName,
        arguments: arguments,
        builder: (context) => const LoginPage(),
      );

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
    appLocalizations = AppLocalizations.of(context)!;
    return StreamPlatformStackContent(
        dataStream: bloc.dataStream,
        children: (blocData) {
          return _loginPageItem(blocData);
        });
  }

  _loginPageItem(BlocData blocData) {
    final screenData = blocData.data;
    Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(height: 20),
          LoginTextField(
            keyState: bloc.loginFieldKey,
            onSaved: (value) => bloc.onSave[_login] = value ?? "",
            obscure: false,
            validator: (value) => errorMapper.mapErrorToMessage(
              context,
              screenData.exception?.emailError,
            ),
            onChanged: bloc.setLogin,
            text: _login,
          ),
          const SizedBox(height: 20),
          LoginTextField(
            keyState: bloc.passwordFieldKey,
            obscure: true,
            validator: (value) => errorMapper.mapErrorToMessage(
              context,
              screenData.exception?.passwordError,
            ),
            onSaved: (value) => bloc.onSave[_password] = value ?? "",
            onChanged: bloc.setPassword,
            text: _password,
          ),
          const Spacer(),
          PrimaryButton(onTap: bloc.login, text: "Login"),
        ],
      )),
    );
  }
}
