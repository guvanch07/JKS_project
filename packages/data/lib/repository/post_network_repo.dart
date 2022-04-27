// import 'package:data/core/api_key.dart';
// import 'package:data/repository/api_base_repository.dart';
// import 'package:data/service/api_service.dart';
// import 'package:dio/dio.dart';
// import 'package:domain/model/api_exception.dart';
// import 'package:domain/model/api_post_response.dart';
// import 'package:domain/repository/post_network_repo.dart';

// class PostNetworkRepository extends ApiBaseRepositoryImpl
//     implements IPostNetworkRepository {
//   final ApiService _service;
//   final CancelToken _cancelToken;

//   PostNetworkRepository(this._service, this._cancelToken)
//       : super(cancelToken: _cancelToken);

//   @override
//   Future<PostResponse> sendJobs() {
//     return _service.post(path: ApiHelperCore.baseUrl).then((value) =>
//         Future.value(PostResponse.toJson(value.data))
//             .onError((error, stackTrace) {
//           if (error is DioError && error.response?.statusCode == 401) {
//             return Future.error(
//               AuthException("error", "error"),
//             );
//           }

//           if (error is DioError && error.response?.statusCode == 404) {
//             return Future.error("not found");
//           } else {
//             return Future.error(error!);
//           }
//         }));
//   }
// }
