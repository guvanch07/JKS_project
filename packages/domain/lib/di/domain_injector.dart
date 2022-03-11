import 'package:domain/repository/login/login_repositoy.dart';
import 'package:domain/usecase/login/get_login_usecase.dart';
import 'package:domain/usecase/login/send_register_usecase.dart';
import 'package:get_it/get_it.dart';

Future<void> initDomainModule() async {
  _initUseCaseModule();
}

void _initUseCaseModule() {
  GetIt.I.registerFactory(
    () => GetRegistrationStepUseCase(GetIt.I.get<LoginRepository>()),
  );
  GetIt.I.registerFactory(
    () => SendRegistrationStepUseCase(GetIt.I.get<LoginRepository>()),
  );
}
