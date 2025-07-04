class PostResponse{
  final String userName;
  final int countNum;

  PostResponse({
    required this.userName,
    required this.countNum,
  });

  factory PostResponse.fromJson(Map<String, dynamic> json) {
    return PostResponse(
      userName: json['userName'],
      countNum: json['countNum'],
    );
  }
}