import 'package:domain/core.domain/core.usecase/base_repository.dart';
import 'package:domain/entities/login/crumb/clumber.dart';

abstract class CrumbRepository implements BaseRepository {
  Future<Crumb> getCrumb();
  @override
  void dispose() {}
}
