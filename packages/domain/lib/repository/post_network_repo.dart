import 'package:domain/model/api_post_response.dart';
import 'package:domain/repository/base_repository.dart';

abstract class IPostNetworkRepository implements BaseRepository {
  Future<PostResponse> sendJobs();
}
