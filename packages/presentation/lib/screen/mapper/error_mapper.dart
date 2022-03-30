import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ErrorMapper {
  String? mapErrorToMessage(BuildContext context, String? errorKey) {
    final _appLocalizations = AppLocalizations.of(context)!;

    switch (errorKey) {
      case "login.RequiredFieldImpl":
        return _appLocalizations.requiredField;
      case "login.LengthImpl":
        return _appLocalizations.loginMinLength;
      case "login.invalid":
        return _appLocalizations.invalidLogin;
      case "password.RequiredFieldImpl":
        return _appLocalizations.requiredField;
      case "password.RegExpImpl":
        return _appLocalizations.passwordNotMatch;
      case "password.invalid":
        return _appLocalizations.invalidPassword;
      default:
        return null;
    }
  }
}
