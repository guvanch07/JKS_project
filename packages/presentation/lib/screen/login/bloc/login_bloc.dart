import 'package:domain/model/api_exception.dart';
import 'package:domain/usecase/login_usecase.dart';
import 'package:flutter/material.dart';
import 'package:presentation/base/base_bloc.dart';
import 'package:presentation/base/impl_base_bloc.dart';
import 'package:presentation/screen/home/home_tab_bar.dart';

import 'package:presentation/screen/login/bloc/login_data.dart';
import 'package:domain/usecase/validation_usecase.dart';
import 'package:presentation/screen/mapper/login_view_mapper.dart';

abstract class LoginBloc extends BaseBloc {
  GlobalKey<FormFieldState> get loginFieldKey;

  GlobalKey<FormFieldState> get passwordFieldKey;

  FocusNode get loginFocusNode;

  FocusNode get passwordFocusNode;

  Map<String, String> get onSave;

  factory LoginBloc(
    LoginStepUseCase loginUseCase,
    LoginValidationUseCase loginValidationUseCase,
    LoginViewMapper loginViewMapper,
  ) =>
      _LoginBloc(
        loginUseCase,
        loginValidationUseCase,
        loginViewMapper,
      );

  void _navigateToHomePage();

  void login();

  void setLogin(String login);

  void setPassword(String password);
}

class _LoginBloc extends BlocImpl implements LoginBloc {
  @override
  Map<String, String> get onSave => <String, String>{};

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

  final LoginStepUseCase _loginUseCase;
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
  void _navigateToHomePage() {
    appNavigator.popAndPush(
      HomeTabBar.page(),
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

        _navigateToHomePage();
      },
      errorAction: (e) {
        if (e is AuthException) {
          _screenData.exception = e;
          if (loginFieldKey.currentState != true &&
              !loginFieldKey.currentState!.validate()) {
            loginFocusNode.requestFocus();
          }
          if (passwordFieldKey.currentState != true &&
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
