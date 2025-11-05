import 'dart:io';
import 'package:dio/dio.dart';
import '../services/http/api_service.dart';
import '../models/upload/upload_response.dart';

/// Get upload token from File server
/// 从File服务器获取上传临时token和URL
Future<Map<String, dynamic>> getUploadToken({
  required String filename,
  String? contentType,
}) async {
  final response = await fileHttpClient.post(
    '/upload/token',
    data: {
      'filename': filename,
      if (contentType != null) 'contentType': contentType,
    },
  );
  return response.data;
  // Expected response: {uploadUrl, token, fields}
}

/// Upload avatar image
/// 流程：1. 获取token 2. 上传到S3
Future<UploadResponse> uploadAvatar(
  File file, {
  ProgressCallback? onProgress,
}) async {
  // Step 1: 从File服务器获取上传token
  final tokenData = await getUploadToken(filename: 'avatar.jpg');
  final uploadUrl = tokenData['uploadUrl'] as String;
  final token = tokenData['token'] as String?;

  // Step 2: 直接上传到S3/OSS
  final formData = FormData.fromMap({
    'file': await MultipartFile.fromFile(file.path, filename: 'avatar.jpg'),
    if (token != null) 'token': token,
    ...?tokenData['fields'], // S3可能需要的额外字段
  });

  final response = await uploadClient.post(
    uploadUrl,
    data: formData,
    onSendProgress: onProgress,
  );

  return UploadResponse.fromJson(response.data);
}

/// Upload multiple files
/// 流程：1. 批量获取token 2. 并发上传到S3
Future<List<UploadResponse>> uploadFiles({
  required List<File> files,
  String? description,
  ProgressCallback? onProgress,
}) async {
  final results = <UploadResponse>[];

  for (final file in files) {
    // Step 1: 获取单个文件的token
    final tokenData = await getUploadToken(filename: file.path.split('/').last);
    final uploadUrl = tokenData['uploadUrl'] as String;
    final token = tokenData['token'] as String?;

    // Step 2: 上传到S3
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path),
      if (token != null) 'token': token,
      if (description != null) 'description': description,
      ...?tokenData['fields'],
    });

    final response = await uploadClient.post(
      uploadUrl,
      data: formData,
      onSendProgress: onProgress,
    );

    results.add(UploadResponse.fromJson(response.data));
  }

  return results;
}

/// Upload file from bytes (useful for web or camera photos)
/// 流程：1. 获取token 2. 上传bytes到S3
Future<UploadResponse> uploadFromBytes({
  required List<int> bytes,
  required String filename,
}) async {
  // Step 1: 从File服务器获取上传token
  final tokenData = await getUploadToken(filename: filename);
  final uploadUrl = tokenData['uploadUrl'] as String;
  final token = tokenData['token'] as String?;

  // Step 2: 上传到S3
  final formData = FormData.fromMap({
    'file': MultipartFile.fromBytes(bytes, filename: filename),
    if (token != null) 'token': token,
    ...?tokenData['fields'],
  });

  final response = await uploadClient.post(uploadUrl, data: formData);
  return UploadResponse.fromJson(response.data);
}

/// Download file
/// 从S3/CDN下载文件
Future<void> downloadFile({
  required String url,
  required String savePath,
  Function(int received, int total)? onProgress,
}) async {
  await uploadClient.downloadFile(url, savePath, onReceiveProgress: onProgress);
}
