import 'package:flutter/material.dart';
import 'package:presentation/base/bloc_data.dart';
import 'package:presentation/base/bloc_state.dart';
import 'package:presentation/base/stream_platform_stack_content.dart';
import 'package:presentation/core/helpers/primary_button.dart';
import 'package:presentation/mapper/error_mapper.dart';
import 'package:presentation/navigator/base_arguments.dart';
import 'package:presentation/navigator/base_page.dart';
import 'package:presentation/screen/login/bloc/login_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:presentation/widget/text_fields/text_field_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const routeName = '/LoginPage';

  static BasePage page({BaseArguments? arguments}) => BasePage(
        key: const ValueKey(routeName),
        name: routeName,
        arguments: arguments,
        builder: (context) => const LoginPage(),
      );

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
        return _BuildLoginPage(
          bloc: bloc,
          blocData: blocData,
          errorMapper: errorMapper,
          appLocalizations: appLocalizations,
        );
      },
    );
  }
}

class _BuildLoginPage extends StatelessWidget {
  const _BuildLoginPage({
    Key? key,
    required this.blocData,
    required this.bloc,
    this.appLocalizations,
    required this.errorMapper,
  }) : super(key: key);

  final BlocData blocData;
  final LoginBloc bloc;
  final AppLocalizations? appLocalizations;
  final ErrorMapper errorMapper;

  @override
  Widget build(BuildContext context) {
    final screenData = blocData.data;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(appLocalizations?.labelLogin ?? ""),
            ),
            LoginTextField(
              //key: const Key("login"),
              isSuffixExsist: false,
              keyState: bloc.loginFieldKey,
              focusNode: bloc.loginFocusNode,
              //onSaved: (value) => bloc.onSave[_login] = value ?? "",
              obscure: false,
              validator: (value) => errorMapper.mapErrorToMessage(
                  context, screenData.exception?.loginError),
              onChanged: bloc.setLogin,
              text: appLocalizations?.labelLogin ?? "",
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(appLocalizations?.labelPassword ?? ""),
            ),
            LoginTextField(
              //key: const Key("password"),
              isSuffixExsist: true,
              focusNode: bloc.passwordFocusNode,
              keyState: bloc.passwordFieldKey,
              //onSaved: (value) => bloc.onSave[_login] = value ?? "",
              obscure: true,
              validator: (value) => errorMapper.mapErrorToMessage(
                  context, screenData.exception?.passwordError),
              onChanged: bloc.setPassword,
              text: appLocalizations?.labelPassword ?? "Password",
            ),
            Visibility(
              visible: blocData.isLoading,
              child: const Padding(
                padding: EdgeInsets.only(top: 50),
                child: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            ),
            const Spacer(),
            Center(
                child: PrimaryButton(
                    //key: const Key("login_button"),
                    onTap: bloc.login,
                    text: appLocalizations?.buttonLogin ?? "")),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
