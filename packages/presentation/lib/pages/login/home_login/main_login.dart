import 'package:flutter/material.dart';
import 'package:presentation/bloc/login/home_bloc.dart';
import 'package:presentation/bloc/login/home_data.dart';
import 'package:presentation/core/bloc/bloc_state.dart';
import 'package:presentation/core/bloc/stream_palform.dart';

class MyHomePageLogin extends StatefulWidget {
  const MyHomePageLogin({Key? key}) : super(key: key);

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
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 32, top: 32),
          child: ElevatedButton(
            onPressed: bloc.getRegistration,
            child: const Center(
              child: Text("Get registration"),
            ),
          ),
        ),
        Text(screenData.registrationStep ?? ''),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          onChanged: bloc.onEmailChanged,
          decoration: const InputDecoration(
            hintText: 'Email',
          ),
        ),
        TextFormField(
          keyboardType: TextInputType.phone,
          onChanged: bloc.onPasswordChanged,
          decoration: const InputDecoration(
            hintText: 'Phone',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32, top: 16, right: 32),
          child: OutlinedButton(
            onPressed: bloc.sendRegistration,
            child: const Center(
              child: Text("Send registration"),
            ),
          ),
        ),
      ],
    );
  }
}
