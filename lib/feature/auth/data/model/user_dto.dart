import 'package:flutter_templete/feature/auth/domain/model/user.dart';

class UserDto {
  final String email;
  final String password;

  UserDto({
    required this.email,
    required this.password,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  User toDomain() {
    return User(email: email, password: password);
  }

  factory UserDto.fromDomain(User user) {
    return UserDto(email: user.email, password: user.password);
  }
}
