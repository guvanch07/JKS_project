import 'package:domain/repository/login/login_repositoy.dart';
import 'package:domain/core.domain/core.usecase/usecase.dart';

class GetRegistrationStepUseCase implements UseCase<Future<String?>> {
  final LoginRepository _repository;
  GetRegistrationStepUseCase(
    this._repository,
  );

  @override
  Future<String?> call() async =>
      _repository.getLogin().then((value) => value.step);

  @override
  void dispose() {}
}
