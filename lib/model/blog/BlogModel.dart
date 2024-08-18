import 'package:flutter/foundation.dart';
import 'package:vani_ashok_blogs/model/fileUpload/FileUploadModel.dart';
import 'package:vani_ashok_blogs/model/login/UserModel.dart';

class BlogModel {
  final int id;
  final int userId;
  final String title;
  final int? image;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;
  final FileUploadModel fileUpload;
  final UserModel user;

  BlogModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.image,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.fileUpload,
    required this.user,
  });

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    json['User']['accessToken'] = "";
    return BlogModel(
    id: json['id'] ?? 0, // Default value
    userId: json['userId'] ?? 0, // Default value
    title: json['title'] ?? 'Untitled', // Default value
    image: json['image'] != null ? json['image'] as int : null, // Nullable field
    content: json['content'] ?? '',
    createdAt: DateTime.parse(json['createdAt']),
    updatedAt: DateTime.parse(json['updatedAt']),
    fileUpload: FileUploadModel.fromJson(json['fileUpload']),
    user: UserModel.fromJson(json['User']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'image': image,
      'content': content,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'fileUpload': fileUpload.toJson(),
      'User': user.toJson(),
    };
  }
}