import 'package:domain/model/api_registration_response.dart';
import 'package:domain/repository/network_repository.dart';

import 'usecase.dart';

class GetRegistrationStepUseCase implements UseCase<Future<CardModel?>> {
  final INetworkRepository _repository;

  GetRegistrationStepUseCase(this._repository);

  @override
  Future<CardModel?> call() async => _repository.getJobs();

  @override
  void dispose() {
    _repository.dispose();
  }
}
