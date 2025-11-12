import 'dart:io';
import 'package:dio/dio.dart';

class HttpClient {
  late final Dio _dio;

  /// Create HttpClient with JSON configuration
  HttpClient.json({
    required String baseUrl,
    Duration connectTimeout = const Duration(seconds: 30),
    Duration receiveTimeout = const Duration(seconds: 30),
    Map<String, dynamic>? headers,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          ...?headers,
        },
      ),
    );
  }

  /// Create HttpClient for file upload (multipart/form-data)
  HttpClient.upload({
    String? baseUrl,
    Duration connectTimeout = const Duration(seconds: 60),
    Duration receiveTimeout = const Duration(seconds: 60),
    Map<String, dynamic>? headers,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? '', // 使用空字符串作为默认值（上传到S3时使用完整URL）
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        headers: {'Accept': 'application/json', ...?headers},
        // Content-Type will be set automatically to multipart/form-data
      ),
    );
  }

  /// Get internal Dio instance (for advanced usage like adding interceptors)
  Dio get dio => _dio;

  // ==================== JSON Requests ====================

  /// GET request with JSON response
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(url, queryParameters: queryParameters);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// POST request with JSON data
  Future<Response> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        onSendProgress: onSendProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// PUT request with JSON data
  Future<Response> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// PATCH request with JSON data
  Future<Response> patch(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.patch(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// DELETE request with JSON data
  Future<Response> delete(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // ==================== Form Data Requests ====================

  /// POST request with form data
  Future<Response> postForm(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final formData = FormData.fromMap(data ?? {});
      final response = await _dio.post(
        url,
        data: formData,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// PUT request with form data
  Future<Response> putForm(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final formData = FormData.fromMap(data ?? {});
      final response = await _dio.put(
        url,
        data: formData,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// PATCH request with form data
  Future<Response> patchForm(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final formData = FormData.fromMap(data ?? {});
      final response = await _dio.patch(
        url,
        data: formData,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // ==================== File Upload ====================

  /// Upload a single file
  ///
  /// [url] - The upload endpoint
  /// [file] - The file to upload
  /// [fieldName] - The form field name (default: "file")
  /// [data] - Additional form data to send along with the file
  /// [onSendProgress] - Progress callback (current, total)
  Future<Response> uploadFile(
    String url,
    File file, {
    String fieldName = 'file',
    Map<String, dynamic>? data,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      final fileName = file.path.split('/').last;
      final formData = FormData.fromMap({
        fieldName: await MultipartFile.fromFile(file.path, filename: fileName),
        ...?data,
      });

      final response = await _dio.post(
        url,
        data: formData,
        onSendProgress: onSendProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// Upload multiple files
  ///
  /// [url] - The upload endpoint
  /// [files] - List of files to upload
  /// [fieldName] - The form field name (default: "files")
  /// [data] - Additional form data to send along with the files
  /// [onSendProgress] - Progress callback (current, total)
  Future<Response> uploadFiles(
    String url,
    List<File> files, {
    String fieldName = 'files',
    Map<String, dynamic>? data,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      final multipartFiles = await Future.wait(
        files.map((file) async {
          final fileName = file.path.split('/').last;
          return MultipartFile.fromFile(file.path, filename: fileName);
        }),
      );

      final formData = FormData.fromMap({fieldName: multipartFiles, ...?data});

      final response = await _dio.post(
        url,
        data: formData,
        onSendProgress: onSendProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// Upload files with custom field names
  ///
  /// [url] - The upload endpoint
  /// [fileMap] - Map of field names to files
  /// [data] - Additional form data to send along with the files
  /// [onSendProgress] - Progress callback (current, total)
  Future<Response> uploadFilesWithFields(
    String url,
    Map<String, File> fileMap, {
    Map<String, dynamic>? data,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      final formDataMap = <String, dynamic>{};

      for (final entry in fileMap.entries) {
        final fileName = entry.value.path.split('/').last;
        formDataMap[entry.key] = await MultipartFile.fromFile(
          entry.value.path,
          filename: fileName,
        );
      }

      if (data != null) {
        formDataMap.addAll(data);
      }

      final formData = FormData.fromMap(formDataMap);

      final response = await _dio.post(
        url,
        data: formData,
        onSendProgress: onSendProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// Upload file from bytes
  ///
  /// [url] - The upload endpoint
  /// [bytes] - The file bytes
  /// [filename] - The filename to use
  /// [fieldName] - The form field name (default: "file")
  /// [data] - Additional form data to send along with the file
  /// [onSendProgress] - Progress callback (current, total)
  Future<Response> uploadFileFromBytes(
    String url,
    List<int> bytes,
    String filename, {
    String fieldName = 'file',
    Map<String, dynamic>? data,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      final formData = FormData.fromMap({
        fieldName: MultipartFile.fromBytes(bytes, filename: filename),
        ...?data,
      });

      final response = await _dio.post(
        url,
        data: formData,
        onSendProgress: onSendProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// Download file
  ///
  /// [url] - The download URL
  /// [savePath] - Path where the file will be saved
  /// [onReceiveProgress] - Progress callback (current, total)
  Future<Response> downloadFile(
    String url,
    String savePath, {
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.download(
        url,
        savePath,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
