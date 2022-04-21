import 'package:domain/repository/local_base_repo.dart';

import 'base_usecase.dart';

class TokenUseCase implements UseCase<Future<bool>> {
  final ILocalStorageRepo _repository;

  TokenUseCase(this._repository);

  @override
  Future<bool> call() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    final isToken = await _repository.getToken() != null;

    return Future.value(isToken);
  }

  @override
  void dispose() {
    _repository.dispose();
  }
}
