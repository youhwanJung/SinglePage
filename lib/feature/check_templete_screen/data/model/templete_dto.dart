import 'dart:convert';

import 'package:flutter_templete/feature/auth/domain/model/login.dart';
import 'package:flutter_templete/feature/check_templete_screen/domain/model/templete.dart';

class TempleteDto {
  final String id;
  final String templateName;
  final String description;
  final String status;
  final String createdAt;
  final String updatedAt;

  TempleteDto({
    required this.id,
    required this.templateName,
    required this.description,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TempleteDto.fromJson(Map<String, dynamic> json) {
    return TempleteDto(
      id: json['id'] as String,
      templateName: json['templateName'] as String,
      description: json['description'] as String,
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );
  }

  Templete toDomain() {
    return Templete(
      id: id,
      templateName: templateName,
      description: description,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt
    );
  }
}