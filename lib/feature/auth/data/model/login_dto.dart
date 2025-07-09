import 'dart:convert';

import 'package:flutter_templete/feature/auth/domain/model/login.dart';

class LoginDto {
  final String id;
  final String email;
  final String grantType;
  final String accessToken;
  final String accessTokenExpiredAt;

  LoginDto({
    required this.id,
    required this.email,
    required this.grantType,
    required this.accessToken,
    required this.accessTokenExpiredAt,
  });

  factory LoginDto.fromJson(Map<String, dynamic> json) {
    return LoginDto(
      id: json['id'] as String,
      email: json['email'] as String,
      grantType: json['grantType'] as String,
      accessToken: json['accessToken'] as String,
      accessTokenExpiredAt: json['accessTokenExpiredAt'] as String,
    );
  }

  Login toDomain() {
    return Login(
      id: id,
      email: email,
      grantType: grantType,
      accessToken: accessToken,
      accessTokenExpiredAt: DateTime.parse(accessTokenExpiredAt),
    );
  }
}