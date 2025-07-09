class Login {
  final String id;
  final String email;
  final String grantType;
  final String accessToken;
  final DateTime accessTokenExpiredAt;

  Login({
    required this.id,
    required this.email,
    required this.grantType,
    required this.accessToken,
    required this.accessTokenExpiredAt,
  });
}