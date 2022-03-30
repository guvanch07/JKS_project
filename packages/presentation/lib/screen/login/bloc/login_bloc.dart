import 'package:data/models/auth_exception.dart';
import 'package:domain/model/login_step_field.dart';
import 'package:domain/usecase/get_registration_use_case.dart';
import 'package:flutter/material.dart';
import 'package:presentation/base/bloc_base.dart';
import 'package:presentation/base/bloc_base_impl.dart';

import 'package:presentation/screen/login/bloc/login_data.dart';

abstract class LoginBloc implements BaseBloc {
  factory LoginBloc(
    LoginStepUseCase loginStepUseCase,
  ) =>
      _LoginBloc(loginStepUseCase);

  void login();

  void setLogin(String login);

  void setPassword(String password);

  GlobalKey<FormFieldState> get loginFormKey;

  GlobalKey<FormFieldState> get passwordFormKey;
}

class _LoginBloc extends BlocImpl implements LoginBloc {
  final LoginStepUseCase _loginStepUseCase;

  _LoginBloc(this._loginStepUseCase);

  bool _isLoading = false;

  final _screenData = LoginData.init();

  void updateData() {
    super.handleData(
      isLoading: _isLoading,
      data: _screenData.copy(),
    );
  }

  @override
  void initState() {
    super.initState();
    updateData();
  }

  @override
  void login() async {
    _isLoading = true;
    updateData();

    final authFields =
        LoginParms(_screenData.loginInput, _screenData.passwordInput);

    try {
      await _loginStepUseCase(authFields).then((value) {
        _screenData.exception == null;
      });
    } catch (e) {
      if (e is AuthException) {
        _screenData.exception == e;
      }
    } finally {
      _isLoading = false;
      updateData();
    }
  }

  @override
  void setLogin(String login) {
    _screenData.loginInput = login;
  }

  @override
  void setPassword(String password) {
    _screenData.passwordInput = password;
  }

  @override
  void dispose() {
    super.dispose();
    _loginStepUseCase.dispose();
  }

  @override
  GlobalKey<FormFieldState> get loginFormKey => _loginFieldKey;

  @override
  GlobalKey<FormFieldState> get passwordFormKey => _passwordFieldKey;

  final _loginFieldKey = GlobalKey<FormFieldState>();
  final _passwordFieldKey = GlobalKey<FormFieldState>();
}
