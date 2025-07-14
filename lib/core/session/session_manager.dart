import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_templete/core/enum/session_key.dart';

class SessionManager {
  static final FlutterSecureStorage _storage = FlutterSecureStorage();

  static Future<void> saveSession({
    required String accessToken,
    required DateTime expiredAt,
    required String userId,
    required String email,
    required String grantType,
    required String password,

  }) async {
    await _storage.write(key: SessionKey.accessToken.value, value: accessToken);
    await _storage.write(key: SessionKey.accessTokenExpiredAt.value, value: expiredAt.toIso8601String());
    await _storage.write(key: SessionKey.userId.value, value: userId);
    await _storage.write(key: SessionKey.email.value, value: email);
    await _storage.write(key: SessionKey.grantType.value, value: grantType);
    await _storage.write(key: SessionKey.password.value, value: password);

  }

  static Future<String?> getToken() => _storage.read(key: SessionKey.accessToken.value);
  static Future<String?> getGrantType() => _storage.read(key: SessionKey.grantType.value);
  static Future<String?> getId() => _storage.read(key: SessionKey.userId.value);
  static Future<String?> getEmail() => _storage.read(key: SessionKey.email.value);


  static Future<bool> isExpired() async {
    final expiredAtStr = await _storage.read(key: SessionKey.accessTokenExpiredAt.value);
    if (expiredAtStr == null) return true;
    final expiredAt = DateTime.parse(expiredAtStr);
    return DateTime.now().isAfter(expiredAt);
  }

  static Future<bool> canAutoLogin() async {
    final token = await getToken();
    if (token == null) return false;
    return (await isExpired());
  }

  static Future<void> clearSession() async {
    await _storage.deleteAll();
  }
}
