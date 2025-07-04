class Result<T> {
  final T? data;
  final String? error;

  Result._({this.data, this.error});

  factory Result.success(T data) => Result._(data: data);
  factory Result.failure(String error) => Result._(error: error);

  bool get isSuccess => data != null;
  bool get isFailure => error != null;

  Result<R> map<R>(R Function(T data) transform) {
    if (isSuccess) {
      return Result.success(transform(data as T));
    } else {
      return Result.failure(error as String);
    }
  }
}