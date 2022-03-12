import 'package:flutter/material.dart';
import 'package:presentation/bloc/login/home_bloc.dart';
import 'package:presentation/bloc/login/home_data.dart';
import 'package:presentation/core/bloc/bloc_state.dart';
import 'package:presentation/core/bloc/stream_palform.dart';
import 'package:presentation/core/helpers/primary_button.dart';
import 'package:presentation/widgets/text_field.dart';

class MyHomePageLogin extends StatefulWidget {
  const MyHomePageLogin({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  State<MyHomePageLogin> createState() => _MyHomePageLoginState();
}

class _MyHomePageLoginState extends BlocState<MyHomePageLogin, HomeBloc> {
  @override
  void initState() {
    super.initState();
    bloc.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamPlatformStackContent(
      dataStream: bloc.dataStream,
      children: (blocdata) {
        final screenData = blocdata.data;
        if (screenData is HomeData) {
          return SafeArea(
              child: _BuildResultState(screenData: screenData, bloc: bloc));
        }
      },
    );
  }
}

class _BuildResultState extends StatelessWidget {
  const _BuildResultState({
    Key? key,
    required this.screenData,
    required this.bloc,
  }) : super(key: key);

  final HomeData screenData;
  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        LoginTextField(
          type: TextInputType.emailAddress,
          onChanged: bloc.onEmailChanged,
          error: '',
          obscure: false,
          text: 'Email',
        ),
        const SizedBox(height: 30),
        LoginTextField(
          type: TextInputType.visiblePassword,
          onChanged: bloc.onPasswordChanged,
          error: '',
          text: 'Password',
          obscure: true,
        ),
        const Spacer(),
        PrimaryButton(
          onTap: () {},
          text: "Login",
        )
      ],
    );
  }
}
