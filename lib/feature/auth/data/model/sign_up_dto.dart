import 'package:flutter_templete/feature/auth/domain/model/sign_up.dart';

class SignUpDto {
  final String email;
  final String createdAt;

  SignUpDto({
    required this.email,
    required this.createdAt,
  });

  factory SignUpDto.fromJson(Map<String, dynamic> json) {
    return SignUpDto(
      email: json['email'] as String,
      createdAt: json['createdAt'] as String,
    );
  }

  SignUp toDomain() {
    return SignUp(
      email: email,
      createdAt: createdAt,
    );
  }
}