enum SessionKey {
  accessToken,
  accessTokenExpiredAt,
  userId,
  email,
  grantType,
  password;

  String get value {
    switch (this) {
      case SessionKey.accessToken:
        return 'accessToken';
      case SessionKey.accessTokenExpiredAt:
        return 'accessTokenExpiredAt';
      case SessionKey.userId:
        return 'userId';
      case SessionKey.email:
        return 'email';
      case SessionKey.grantType:
        return 'grantType';
      case SessionKey.password:
        return 'password';
    }
  }
}