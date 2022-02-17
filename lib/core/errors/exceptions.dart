class ServerException implements Exception {
  final int statusCode;

  ServerException(this.statusCode);
}

class LocalStorageException implements Exception {
  final String message;

  LocalStorageException(this.message);
}
