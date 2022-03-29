import 'package:domain/model/api_exception.dart';
import 'package:domain/usecase/login_usecase.dart';
import 'package:domain/usecase/validation_usecase.dart';
import 'package:flutter/material.dart';
import 'package:presentation/base/base_bloc.dart';
import 'package:presentation/base/impl_base_bloc.dart';
import 'package:presentation/screen/home/home_tab_bar.dart';
import 'package:presentation/screen/login/bloc/login_data.dart';
import 'package:presentation/screen/mapper/login_view_mapper.dart';

abstract class LoginBloc implements BaseBloc {
  factory LoginBloc(
    LoginStepUseCase loginStepUseCase,
    LoginValidationUseCase loginValidationUseCase,
    LoginViewMapper loginViewMapper,
  ) =>
      _LoginBloc(
        loginStepUseCase,
        loginValidationUseCase,
        loginViewMapper,
      );

  void navigateToHomePage();

  void login();

  void setLogin(String login);

  void setPassword(String password);

  GlobalKey<FormFieldState> get loginFieldKey;

  GlobalKey<FormFieldState> get passwordFieldKey;

  Map<String, String> get onSave;
}

class _LoginBloc extends BlocImpl implements LoginBloc {
  final LoginStepUseCase _loginStepUseCase;
  final LoginValidationUseCase _loginValidationUseCase;
  final LoginViewMapper _loginViewMapper;

  _LoginBloc(
    this._loginStepUseCase,
    this._loginValidationUseCase,
    this._loginViewMapper,
  );

  @override
  void navigateToHomePage() {
    appNavigator.push(HomeTabBar.page());
  }

  @override
  GlobalKey<FormFieldState> get loginFieldKey => GlobalKey<FormFieldState>();

  @override
  GlobalKey<FormFieldState> get passwordFieldKey => GlobalKey<FormFieldState>();

  @override
  Map<String, String> get onSave => <String, String>{};

  final bool _isLoading = false;

  final _screenData = LoginData.init();

  @override
  void initState() {
    super.initState();
    _updateData();
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
  void login() async {
    launchPayLoad(
      action: () async {
        _screenData.exception == null;
        loginFieldKey.currentState?.validate();
        passwordFieldKey.currentState?.validate();
        loginFieldKey.currentState?.save();
        passwordFieldKey.currentState?.save();

        final requestData =
            _loginViewMapper.mapScreenDataToRequest(_screenData);

        await _loginValidationUseCase(
          requestData,
        );

        await _loginStepUseCase(
          requestData,
        );

        //! is it ok if navigate page here not in the ui???

        _updateData();

        navigateToHomePage();
      },
      errorAction: (e) {
        if (e is AuthException) {
          _screenData.exception = e;
        }
      },
    );
  }

  void _updateData() {
    super.handleData(
      isLoading: _isLoading,
      data: _screenData,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _loginStepUseCase.dispose();
    _loginValidationUseCase.dispose();
    loginFieldKey.currentState?.dispose();
    passwordFieldKey.currentState?.dispose();
  }
}
