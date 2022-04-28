import 'package:domain/repository/local_storage_repository.dart';
import 'package:domain/usecase/base_usecase.dart';

class TokenUseCase implements UseCase<Future<bool>> {
  final ILocalStorageRepository _repository;

  TokenUseCase(this._repository);

  @override
  Future<bool> call() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    final hasToken = await _repository.getToken() != null;

    return Future.value(hasToken);
  }

  @override
  void dispose() {
    _repository.dispose();
  }
}
