import "../error/failures.dart";

/// Result type for handling success and error states
sealed class Result<T> {
  const Result();

  /// Creates a successful result with a value
  const factory Result.ok(T value) = Ok<T>;

  /// Creates an error result with a failure
  const factory Result.err(Failure failure) = Err<T>;

  /// Returns true if this is a successful result
  bool get isOk => this is Ok<T>;

  /// Returns true if this is an error result
  bool get isErr => this is Err<T>;

  /// Returns the value if successful, null otherwise
  T? get value => isOk ? (this as Ok<T>).value : null;

  /// Returns the failure if error, null otherwise
  Failure? get failure => isErr ? (this as Err<T>).failure : null;

  /// Maps the value if successful
  Result<U> map<U>(U Function(T) mapper) {
    return switch (this) {
      Ok<T>(value: final value) => Result.ok(mapper(value)),
      Err<T>(failure: final failure) => Result.err(failure),
    };
  }

  /// Maps the value if successful, returns a Result
  Result<U> flatMap<U>(Result<U> Function(T) mapper) {
    return switch (this) {
      Ok<T>(value: final value) => mapper(value),
      Err<T>(failure: final failure) => Result.err(failure),
    };
  }
}

/// Successful result
class Ok<T> extends Result<T> {
  const Ok(this.value);
  @override
  final T value;

  @override
  String toString() => "Ok($value)";

  @override
  bool operator ==(Object other) => other is Ok<T> && other.value == value;

  @override
  int get hashCode => value.hashCode;
}

/// Error result
class Err<T> extends Result<T> {
  const Err(this.failure);
  @override
  final Failure failure;

  @override
  String toString() => "Err($failure)";

  @override
  bool operator ==(Object other) => other is Err<T> && other.failure == failure;

  @override
  int get hashCode => failure.hashCode;
}
