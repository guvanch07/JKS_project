class ServerException implements Exception {
  ServerException({required this.message});

  final String message;
}

class CacheException implements Exception {
  CacheException({required this.message});

  final String message;
}

class RunTimeException implements Exception {
  RunTimeException({required this.message});

  final String message;
}

class EmptyException implements Exception {
  EmptyException({required this.message});

  final String message;
}
