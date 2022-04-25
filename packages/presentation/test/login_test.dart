import 'package:domain/usecase/login_usecase.dart';
import 'package:domain/usecase/validation_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:presentation/screen/login/bloc/login_bloc.dart';
import 'package:presentation/screen/login/main_login.dart';
import 'package:presentation/screen/mapper/login_view_mapper.dart';
import 'package:get_it/get_it.dart';

import 'login_test.mocks.dart';

@GenerateMocks([LoginUseCase, LoginValidationUseCase, LoginViewMapper])
void main() {
  final mockGetRegistrationStepUseCase = MockLoginStepUseCase();
  final mockSendRegistrationStepUseCase = MockLoginValidationUseCase();
  final mockHomeViewMapper = MockLoginViewMapper();

  setUpAll((() {
    GetIt.I.registerFactory<LoginBloc>(
      () => LoginBloc(
        mockGetRegistrationStepUseCase,
        mockSendRegistrationStepUseCase,
        mockHomeViewMapper,
      ),
    );
  }));

  testWidgets('get login', (tester) async {
    await tester.pumpWidget(const LoginPage());
    await tester.pumpAndSettle();

    final btnLoginFinder = find.byKey(const Key('login_button'));

    expect(btnLoginFinder, findsNWidgets(1));
  });

  testWidgets('get login', (tester) async {
    await tester.pumpWidget(const LoginPage());
    await tester.pumpAndSettle();

    final btnSendRegistrationFinder = find.byKey(const Key('login_button'));

    when(mockGetRegistrationStepUseCase.call(null)).thenAnswer(
      (realInvocation) => Future.value('login'),
    );

    await tester.tap(btnSendRegistrationFinder);
    await tester.pumpAndSettle();

    expect(find.text('login'), findsOneWidget);

    expect(btnSendRegistrationFinder, findsNWidgets(1));
  });
}
