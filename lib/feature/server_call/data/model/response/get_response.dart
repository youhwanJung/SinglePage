class GetResponse{
  final String message;
  final String status;

  GetResponse({
    required this.message,
    required this.status,
  });

  factory GetResponse.fromJson(Map<String, dynamic> json) {
    return GetResponse(
      message: json['message'],
      status: json['status'],
    );
  }
}