abstract class CustomException implements Exception {
  final String code;
  final String message;

  CustomException({required this.code, required this.message});
}

class ServerException extends CustomException {
  ServerException({required super.code, required super.message});
}

class CacheException extends CustomException {
  CacheException({required super.code, required super.message});
}

class DataException extends CustomException {
  DataException({required super.code, required super.message});
}

class NetworkException extends CustomException {
  NetworkException({required super.code, required super.message});
}

class ExpiredSessionException extends CustomException {
  ExpiredSessionException({required super.code, required super.message});
}