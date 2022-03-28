import 'package:domain/usecase/login_usecase.dart';
import 'package:domain/usecase/validation_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/screen/login/bloc/login_bloc.dart';
import 'package:presentation/screen/mapper/error_mapper.dart';
import 'package:presentation/screen/mapper/login_view_mapper.dart';

void initPresentationModule() {
  final sl = GetIt.I;

  sl.registerSingleton<LoginViewMapper>(
    LoginViewMapper(),
  );

  sl.registerSingleton<ErrorMapper>(
    ErrorMapper(),
  );

  sl.registerFactory(
    () => LoginBloc(
      sl.get<LoginStepUseCase>(),
      sl.get<LoginValidationUseCase>(),
      sl.get<LoginViewMapper>(),
    ),
  );
}
