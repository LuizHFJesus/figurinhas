abstract class Failure {
  final String message;
  Failure({required this.message});
}

class DatabaseFailure extends Failure {
  DatabaseFailure({required super.message});
}

class SeedFailure extends Failure {
  SeedFailure({required super.message});
}

class CacheFailure extends Failure {
  CacheFailure({required super.message});
}
