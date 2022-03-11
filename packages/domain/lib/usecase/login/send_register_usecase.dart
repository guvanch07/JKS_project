import 'package:domain/entities/home_step.dart';
import 'package:domain/repository/login/login_repositoy.dart';
import 'package:domain/usecase/login/usecase.dart';

class SendRegistrationStepUseCase
    implements UseCaseParms<HomeStepFields, Future<void>> {
  final LoginRepository _baseRepository;
  SendRegistrationStepUseCase(
    this._baseRepository,
  );

  @override
  Future<void> call(HomeStepFields parms) async =>
      _baseRepository.sendLogin(parms.toJson());

  @override
  void dispose() {
    _baseRepository.dispose();
  }
}
