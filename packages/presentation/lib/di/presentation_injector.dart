import 'package:domain/usecase/login/get_login_usecase.dart';
import 'package:domain/usecase/login/send_register_usecase.dart';
import 'package:presentation/bloc/login/home_data.dart';
import 'package:presentation/bloc/login/view_mapper.dart';
import 'package:get_it/get_it.dart';

void initPresentationModule() {
  _initHomeScreenModule();
}

void _initHomeScreenModule() {
  GetIt.I.registerFactory<HomeViewMapper>(() => HomeViewMapper());
  GetIt.I.registerFactory<HomeBloc>(
    () => HomeBloc(
      GetIt.I.get<GetRegistrationStepUseCase>(),
      GetIt.I.get<SendRegistrationStepUseCase>(),
      GetIt.I.get<HomeViewMapper>(),
    ),
  );
}
