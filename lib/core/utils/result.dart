class Result<T> {
  final String status;
  final String message;
  final int? code;
  final T? data;

  Result({
    required this.status,
    required this.message,
    required this.data,
    this.code,
  });

  /// Json -> Result<Dto>
  factory Result.fromJson(
      Map<String, dynamic> json,
      T Function(Map<String, dynamic>) fromJsonT,
      ) {
    final dataJson = json['data'];
    final code = json['successCode'] ?? json['errorCode'];
    return Result<T>(
      status: json['status'] as String,
      message: json['message'] as String,
      code: code is int ? code : int.tryParse(code.toString()),
      data: dataJson == null ? null : fromJsonT(dataJson),
    );
  }

  /// Result<Dto> -> Result<Domain>
  Result<R> map<R>(R Function(T value) convert) {
    return Result<R>(
      status: status,
      message: message,
      code: code,
      data: data == null ? null : convert(data as T),
    );
  }
}