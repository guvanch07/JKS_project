// import 'package:data/repository/network_repository.dart';
// import 'package:data/service/api_service.dart';
// import 'package:dio/dio.dart';
// import 'package:domain/model/api_auth_response.dart';
// import 'package:domain/model/job.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// import 'networking_repository_mocks.mocks_test.dart';

// @GenerateMocks([ApiService, CancelToken, DioError])
// void main() {
//   group('getRegistration', () {
//     test(
//       'returns successfully',
//       () async {
//         final cancelToken = MockCancelToken();
//         final apiService = MockApiService();
//         final repository = NetworkRepository(apiService, cancelToken);
//         final Map<String, dynamic> mockJson = {
//           "jobClass": "",
//           "name": "",
//           "url": "",
//           "color": ""
//         };
//         final mockResponse = Job.fromJson(mockJson);

//         when(apiService.get(
//           path: anyNamed('path'),
//           cancelToken: anyNamed('cancelToken'),
//         )).thenAnswer(
//           (_) async => Response(
//             data: mockResponse,
//             requestOptions: RequestOptions(
//               path: '',
//             ),
//           ),
//         );

//         expect(
//           await repository.getJobs(),
//           isA<ApiAuthorizationResponse>(),
//         );
//       },
//     );
//     test(
//       'returns with error',
//       () async {
//         final cancelToken = MockCancelToken();
//         final apiService = MockApiService();
//         final repository = NetworkRepository(apiService, cancelToken);

//         final error = DioError(
//           requestOptions: RequestOptions(path: ''),
//           response: Response(
//             statusCode: 404,
//             requestOptions: RequestOptions(path: ''),
//           ),
//         );

//         when(apiService.get(
//           path: anyNamed('path'),
//           cancelToken: anyNamed('cancelToken'),
//         )).thenAnswer(
//           (realInvocation) => Future.error(error),
//         );

//         expect(
//           () async => await repository.getJobs(),
//           throwsA(error),
//         );
//       },
//     );
//   });
// }
