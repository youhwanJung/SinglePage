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
      T Function(dynamic) fromJsonT,
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

  /// Result<List<Dto>> -> Result<List<Domain>>
  Result<List<R>> mapList<R>(R Function(dynamic value) convert) {
    if (data is List) {
      final List list = data as List;
      final converted = list.map((e) => convert(e)).toList();
      return Result<List<R>>(
        status: status,
        message: message,
        code: code,
        data: converted,
      );
    } else {
      throw Exception('Result.mapList() called on non-list data');
    }
  }
}