abstract class IRequestRepository {
  Future<dynamic> request({
    required String path,
    String? method,
    Map<String, dynamic>? headers,
  });
}
