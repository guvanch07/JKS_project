import 'package:domain/usecase/get_registration_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/screen/login/bloc/login_bloc.dart';

void initPresentationModule() {
  final sl = GetIt.I;

  sl.registerFactory(
    () => LoginBloc(
      sl.get<LoginStepUseCase>(),
    ),
  );
}
