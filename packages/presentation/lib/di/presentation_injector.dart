import 'package:domain/usecase/login_usecase.dart';
import 'package:domain/usecase/validation_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/navigator/app_navigator.dart';
import 'package:presentation/screen/app/bloc/app_bloc.dart';
import 'package:presentation/screen/home/bloc/home_bloc.dart';
import 'package:presentation/screen/login/bloc/login_bloc.dart';
import 'package:presentation/screen/mapper/error_mapper.dart';
import 'package:presentation/screen/mapper/login_view_mapper.dart';
import 'package:domain/usecase/home_usecase.dart';

void initPresentationModule() {
  final sl = GetIt.I;

  sl.registerSingleton<LoginViewMapper>(
    LoginViewMapper(),
  );

  sl.registerSingleton<ErrorMapper>(
    ErrorMapper(),
  );

  sl.registerSingleton<AppNavigator>(
    AppNavigatorImpl(),
  );

  sl.registerFactory<AppBloc>(
    () => AppBloc(),
  );

  sl.registerFactory(
    () => LoginBloc(
      sl.get<LoginStepUseCase>(),
      sl.get<LoginValidationUseCase>(),
      sl.get<LoginViewMapper>(),
    ),
  );

  sl.registerFactory(
    () => HomeBloc(
      sl.get<HomeUseCase>(),
    ),
  );
}
