import 'package:domain/usecase/login/get_login_usecase.dart';
import 'package:domain/usecase/login/send_register_usecase.dart';
import 'package:presentation/bloc/card/card_home_bloc.dart';
import 'package:presentation/bloc/login/home_data.dart';
import 'package:presentation/bloc/login/view_mapper.dart';
import 'package:get_it/get_it.dart';
import 'package:domain/usecase/card/card_usecase.dart';

void initPresentationModule() {
  _initHomeScreenModule();
  _initCardScreenModule();
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

void _initCardScreenModule() {
  GetIt.I.registerFactory<CardHomeBloc>(
    () => CardHomeBloc(
      GetIt.I.get<GetCardUseCase>(),
    ),
  );
}
