part of 'main_login.dart';

class BuildLoginPage extends StatelessWidget {
  const BuildLoginPage({
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
            AppTextField(
              key: const Key("login"),
              isSuffixExsist: false,
              keyState: bloc.loginFieldKey,
              focusNode: bloc.loginFocusNode,
              onSaved: (value) => bloc.onSave[_login] = value ?? "",
              obscure: false,
              validator: (value) => errorMapper.mapErrorToMessage(
                  context, screenData.exception?.loginError),
              onChanged: bloc.setLogin,
              text: _login,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(appLocalizations?.labelPassword ?? ""),
            ),
            AppTextField(
              key: const Key("password"),
              isSuffixExsist: true,
              focusNode: bloc.passwordFocusNode,
              keyState: bloc.passwordFieldKey,
              onSaved: (value) => bloc.onSave[_login] = value ?? "",
              obscure: true,
              // validator: (value) => errorMapper.mapErrorToMessage(
              //     context, screenData.exception?.passwordError),
              onChanged: bloc.setPassword,
              text: _password,
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
                    key: const Key("login_button"),
                    onTap: bloc.login,
                    text: appLocalizations?.buttonLogin ?? "")),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
