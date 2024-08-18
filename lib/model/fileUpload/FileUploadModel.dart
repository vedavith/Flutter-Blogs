import 'package:flutter/foundation.dart';

class FileUploadModel {
  final int fileId;
  final String fileLocation;

  FileUploadModel({
    required this.fileId,
    required this.fileLocation,
  });

  factory FileUploadModel.fromJson(Map<String, dynamic> json) {
    return FileUploadModel(
      fileId: json['fileId'],
      fileLocation: json['fileLocation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fileId': fileId,
      'fileLocation': fileLocation,
    };
  }
}