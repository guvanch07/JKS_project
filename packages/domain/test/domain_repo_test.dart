// import 'package:domain/model/api_auth_response.dart';
// import 'package:domain/model/list_jobs_to_chache.dart';
// import 'package:domain/model/login_parms.dart';
// import 'package:domain/repository/network_repository.dart';
// import 'package:domain/usecase/login_usecase.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// import 'domain_repo_test.mocks.dart';

// @GenerateMocks([INetworkRepository, JobsToCache])
// void main() {
//   test("test usecase login", () async {
//     final repository = MockINetworkRepository();
//     final cache = MockJobsToCache();
//     final usecase = LoginStepUseCase(repository, cache);
//     final mockResponse = ApiAuthorizationResponse([]);
//     final mockParms = LoginParms("", "");

//     when(repository.getJobs()).thenAnswer((_) async => mockResponse);
//     final result = await usecase.call(mockParms);

//     expect(result, mockResponse);
//     verify(usecase.call(mockParms));
//   });
// }
