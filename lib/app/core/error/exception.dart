class ServerException implements Exception {
  final String message;
  const ServerException(this.message);
  List<Object> get props => [message];
}

class NetworkException implements Exception {
  final String message;
  const NetworkException(this.message);
  List<Object> get props => [message];
}
