// core/errors/failures.dart
class Failure {
  final String message;

  Failure(this.message);
}

class DatabaseFailure extends Failure {
  DatabaseFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}
