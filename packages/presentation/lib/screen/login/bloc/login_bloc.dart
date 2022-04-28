import 'package:domain/model/auth/authorization_exception.dart';
import 'package:domain/usecase/login_usecase.dart';
import 'package:flutter/material.dart';
import 'package:presentation/base/bloc_base.dart';
import 'package:presentation/base/bloc_base_impl.dart';
import 'package:presentation/mapper/login_view_mapper.dart';
import 'package:presentation/screen/login/bloc/login_data.dart';
import 'package:domain/usecase/login_validation_usecase.dart';
import 'package:presentation/screen/main/main.dart';

abstract class LoginBloc extends BaseBloc {
  GlobalKey<FormFieldState> get loginFieldKey;

  GlobalKey<FormFieldState> get passwordFieldKey;

  FocusNode get loginFocusNode;

  FocusNode get passwordFocusNode;

  factory LoginBloc(
    LoginUseCase loginUseCase,
    LoginValidationUseCase loginValidationUseCase,
    LoginViewMapper loginViewMapper,
  ) =>
      _LoginBloc(
        loginUseCase,
        loginValidationUseCase,
        loginViewMapper,
      );

  void navigateToHomePage();

  void login();

  void setLogin(String login);

  void setPassword(String password);
}

class _LoginBloc extends BaseBlocImpl implements LoginBloc {
  @override
  final GlobalKey<FormFieldState> loginFieldKey = GlobalKey<FormFieldState>();

  @override
  final GlobalKey<FormFieldState> passwordFieldKey =
      GlobalKey<FormFieldState>();

  @override
  final FocusNode loginFocusNode = FocusNode();

  @override
  final FocusNode passwordFocusNode = FocusNode();

  final _screenData = LoginData.init();

  final LoginUseCase _loginUseCase;
  final LoginValidationUseCase _loginValidationUseCase;
  final LoginViewMapper _loginViewMapper;

  _LoginBloc(
    this._loginUseCase,
    this._loginValidationUseCase,
    this._loginViewMapper,
  );

  @override
  void initState() {
    super.initState();
    _updateData();
  }

  void _updateData() {
    super.handleData(
      isLoading: isLoading,
      data: _screenData,
    );
  }

  @override
  void navigateToHomePage() {
    appNavigator.popAndPush(
      MainPage.page(),
    );
  }

  @override
  void login() async {
    launchPayLoad(
      action: () async {
        _screenData.exception = null;
        loginFieldKey.currentState?.validate();
        passwordFieldKey.currentState?.validate();

        final requestData =
            _loginViewMapper.mapScreenDataToRequest(_screenData);

        await _loginValidationUseCase(
          requestData,
        );

        await _loginUseCase(
          requestData,
        );

        _updateData();

        navigateToHomePage();
      },
      errorAction: (e) {
        if (e is AuthException) {
          _screenData.exception = e;
          if (loginFieldKey.currentState != null &&
              !loginFieldKey.currentState!.validate()) {
            loginFocusNode.requestFocus();
          }
          if (passwordFieldKey.currentState != null &&
              !passwordFieldKey.currentState!.validate()) {
            passwordFocusNode.requestFocus();
          }
          _updateData();
        }
      },
    );
  }

  @override
  void setLogin(String login) {
    if (_screenData.exception?.loginError != null) {
      _screenData.exception?.loginError = null;
      loginFieldKey.currentState?.validate();
    }
    _screenData.loginInput = login;
    _updateData();
  }

  @override
  void setPassword(String password) {
    if (_screenData.exception?.passwordError != null) {
      _screenData.exception?.passwordError = null;
      passwordFieldKey.currentState?.validate();
    }
    _screenData.passwordInput = password;
    _updateData();
  }

  @override
  void dispose() {
    super.dispose();
    _loginUseCase.dispose();
    _loginValidationUseCase.dispose();
    loginFocusNode.dispose();
    passwordFocusNode.dispose();
  }
}
