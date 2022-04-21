import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:presentation/base/bloc_data.dart';
import 'package:presentation/base/bloc_state.dart';
import 'package:presentation/base/stream_platform_stack_content.dart';
import 'package:presentation/core/helpers/primary_button.dart';
import 'package:presentation/navigator/base_argumaents.dart';
import 'package:presentation/navigator/base_page.dart';
import 'package:presentation/screen/login/bloc/login_bloc.dart';
import 'package:presentation/screen/mapper/error_mapper.dart';
import 'package:presentation/widgets/text_field.dart';

part 'login_page.dart';

const String _login = "Login";
const String _password = "Password";

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
        return BuildLoginPage(
          bloc: bloc,
          blocData: blocData,
          errorMapper: errorMapper,
          appLocalizations: appLocalizations,
        );
      },
    );
  }
}

/*********************************************************************************************************
 * in my opinion is best approch to keep ui cleaner 
 * 
 * current page is main where we invoke data and calling widgets we pass data to pages,(widget or etc )
 * best practice if widgets is private that way should use "part and part of" for importing
 * ********************************************************************************************************/
