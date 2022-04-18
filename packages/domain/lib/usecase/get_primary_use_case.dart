import 'package:domain/model/auth_response_cache.dart';
import 'package:domain/usecase/base_usecase.dart';

class GetPrimaryViewUseCase implements UseCase<int> {
  final AuthorizationResponseCache _cache;
  GetPrimaryViewUseCase(
    this._cache,
  );
  @override
  int call() {
    final primaryViewIndex = _cache.views?.indexWhere(
            (element) => element.name == _cache.primaryView.name) ??
        0;

    return primaryViewIndex == -1 ? 0 : primaryViewIndex;
  }

  @override
  void dispose() {}
}
