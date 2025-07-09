class Result<T> {
  final String status;
  final String message;
  final int successCode;
  final T? data;

  Result({
    required this.status,
    required this.message,
    required this.successCode,
    required this.data,
  });

  factory Result.fromJson(
      Map<String, dynamic> json,
      T? Function(Map<String, dynamic>) fromJsonT,
      ) {
    final dataJson = json['data'];
    return Result(
      status: json['status'] as String,
      message: json['message'] as String,
      successCode: json['successCode'] as int,
      data: dataJson == null ? null : fromJsonT(dataJson as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson(
      Map<String, dynamic> Function(T) toJsonT,
      ) {
    return {
      'status': status,
      'message': message,
      'successCode': successCode,
      'data': data == null ? null : toJsonT(data!),
    };
  }
}
