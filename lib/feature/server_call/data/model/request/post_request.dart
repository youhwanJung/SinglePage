class PostRequest {
  final String userName;
  final int countNum;

  PostRequest({
    required this.userName,
    required this.countNum,
  });

  Map<String, dynamic> toJson() => {
    'userName' : userName,
    'countNum' : countNum,
  };
}