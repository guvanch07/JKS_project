import 'package:domain/model/propery/api_property.dart';
import 'package:domain/repository/base_repository.dart';

abstract class IBuildNetworkRepository implements BaseRepository {
  Future<ApiPropertyResponse?> getJobsProperty(String url);
}
