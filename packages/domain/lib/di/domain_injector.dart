import 'package:domain/repository/card/base_card_repo.dart';
import 'package:domain/repository/login/login_repositoy.dart';
import 'package:domain/usecase/card/card_usecase.dart';
import 'package:domain/usecase/login/get_login_usecase.dart';
import 'package:domain/usecase/login/send_register_usecase.dart';
import 'package:get_it/get_it.dart';

Future<void> initDomainModule() async {
  _initUseCaseModule();
  _initcardUseCaseModule();
}

void _initUseCaseModule() {
  GetIt.I.registerFactory(
    () => GetRegistrationStepUseCase(GetIt.I.get<LoginRepository>()),
  );
  GetIt.I.registerFactory(
    () => SendRegistrationStepUseCase(GetIt.I.get<LoginRepository>()),
  );
}

void _initcardUseCaseModule() {
  GetIt.I.registerFactory(
    () => GetCardUseCase(GetIt.I.get<BaseCardRepository>()),
  );
}
