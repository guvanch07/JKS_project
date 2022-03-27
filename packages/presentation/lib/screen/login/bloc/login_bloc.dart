import 'dart:developer';

import 'package:data/core/error_const.dart';
import 'package:data/models/auth_exception.dart';
import 'package:domain/usecase/login_usecase.dart';
import 'package:flutter/material.dart';
import 'package:presentation/base/base_bloc.dart';
import 'package:presentation/base/impl_base_bloc.dart';
import 'package:presentation/screen/login/bloc/login_data.dart';

abstract class LoginBloc implements BaseBloc {
  factory LoginBloc(
    LoginStepUseCase loginStepUseCase,
  ) =>
      _LoginBloc(
        loginStepUseCase,
      );

  String? validateTextEmail(String formEmail);
  String? validateTextPassword(String formPassword);

  void login();

  void setLogin(String login);

  void setPassword(String password);

  GlobalKey<FormState> get keyStore;

  Map<String, String> get onSave;
}

class _LoginBloc extends BlocImpl implements LoginBloc {
  @override
  final GlobalKey<FormState> keyStore = GlobalKey<FormState>();

  @override
  Map<String, String> get onSave => <String, String>{};

  final LoginStepUseCase _loginStepUseCase;

  _LoginBloc(
    this._loginStepUseCase,
  );

  final bool _isLoading = false;

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
    launchPayLoad(
      action: () {
        if (keyStore.currentState!.validate()) {
          keyStore.currentState!.save();
          log("sucsecc");
          //! trigger of navigate
        }
      },
      errorAction: (e) {
        if (e is AuthException) {
          _screenData.exception = e;
        }
      },
    );
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
  String? validateTextEmail(String formEmail) {
    if (formEmail.isEmpty) return "E-mail is requried.";
    // String pattern = r'\w+@\W+\.\w+';
    // RegExp reg = RegExp(pattern);
    if (!formEmail.contains("@")) {
      return ErrorTextField.login_invalid;
    }
    return null;
  }

  @override
  String? validateTextPassword(String formPassword) {
    if (formPassword.isEmpty) return "password is requried.";

    if (formPassword.length < 6) {
      return ErrorTextField.password_invalid;
    }
    return null;
  }
}
