import 'dart:io';
import 'package:dio/dio.dart';
import '../services/http/api_service.dart';
import '../models/upload/upload_response.dart';

/// Upload avatar image
Future<UploadResponse> uploadAvatar(
  File file, {
  ProgressCallback? onProgress,
}) async {
  final response = await fileUploadClient.uploadFile(
    '/user/avatar',
    file,
    fieldName: 'avatar',
    onSendProgress: onProgress,
  );
  return UploadResponse.fromJson(response.data);
}

/// Upload multiple files
Future<List<UploadResponse>> uploadFiles({
  required List<File> files,
  String? description,
  ProgressCallback? onProgress,
}) async {
  final response = await fileUploadClient.uploadFiles(
    '/files/upload',
    files,
    fieldName: 'files',
    data: description != null ? {'description': description} : null,
    onSendProgress: onProgress,
  );

  final List<dynamic> data = response.data as List<dynamic>;
  return data.map((json) => UploadResponse.fromJson(json)).toList();
}

/// Upload file from bytes (useful for web or camera photos)
Future<UploadResponse> uploadFromBytes({
  required List<int> bytes,
  required String filename,
}) async {
  final response = await fileUploadClient.uploadFileFromBytes(
    '/files/upload',
    bytes,
    filename,
    fieldName: 'file',
  );
  return UploadResponse.fromJson(response.data);
}

/// Download file
Future<void> downloadFile({
  required String url,
  required String savePath,
  Function(int received, int total)? onProgress,
}) async {
  await fileUploadClient.downloadFile(
    url,
    savePath,
    onReceiveProgress: onProgress,
  );
}
