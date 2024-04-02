class ServerException implements Exception {
  final String errorText;

  ServerException(this.errorText);
}

class UnauthorizedException implements Exception {
  final String errorText;

  UnauthorizedException(this.errorText);
}
