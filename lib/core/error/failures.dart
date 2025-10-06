/// Base class for all failures in the application
abstract class Failure {
  const Failure({required this.message, this.code});
  final String message;
  final String? code;

  @override
  String toString() => 'Failure: $message${code != null ? ' (Code: $code)' : ''}';
}

/// Network-related failures
class NetworkFailure extends Failure {
  const NetworkFailure({required super.message, super.code});
}

/// Server-related failures
class ServerFailure extends Failure {
  const ServerFailure({required super.message, super.code});
}

/// Cache-related failures
class CacheFailure extends Failure {
  const CacheFailure({required super.message, super.code});
}

/// Unknown failures
class UnknownFailure extends Failure {
  const UnknownFailure({required super.message, super.code});
}
