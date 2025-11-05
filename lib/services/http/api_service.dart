import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'http_client.dart';

class _ApiService {
  static _ApiService? _instance;

  // Base服务器（默认）
  late final HttpClient _baseJsonClient;
  late final HttpClient _baseUploadClient;
  late final Dio _baseJsonDio;
  late final Dio _baseUploadDio;

  // Auth服务器
  late final HttpClient _authJsonClient;
  late final HttpClient _authUploadClient;
  late final Dio _authJsonDio;
  late final Dio _authUploadDio;

  // File服务器
  late final HttpClient _fileJsonClient;
  late final HttpClient _fileUploadClient;
  late final Dio _fileJsonDio;
  late final Dio _fileUploadDio;

  _ApiService._() {
    final baseUrl = dotenv.env['API_BASE_URL'] ?? 'https://api.example.com';
    final authUrl = dotenv.env['API_AUTH_URL'] ?? baseUrl;
    final fileUrl = dotenv.env['API_FILE_URL'] ?? baseUrl;

    // 初始化Base服务器
    _baseJsonDio = _createJsonDio(baseUrl);
    _baseUploadDio = _createUploadDio(baseUrl);
    _baseJsonClient = HttpClient(_baseJsonDio);
    _baseUploadClient = HttpClient(_baseUploadDio);

    // 初始化Auth服务器
    _authJsonDio = _createJsonDio(authUrl);
    _authUploadDio = _createUploadDio(authUrl);
    _authJsonClient = HttpClient(_authJsonDio);
    _authUploadClient = HttpClient(_authUploadDio);

    // 初始化File服务器
    _fileJsonDio = _createJsonDio(fileUrl);
    _fileUploadDio = _createUploadDio(fileUrl);
    _fileJsonClient = HttpClient(_fileJsonDio);
    _fileUploadClient = HttpClient(_fileUploadDio);
  }

  // 创建JSON请求的Dio实例
  Dio _createJsonDio(String baseUrl) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    _addErrorInterceptor(dio);
    return dio;
  }

  // 创建文件上传的Dio实例
  Dio _createUploadDio(String baseUrl) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 60), // 上传超时时间更长
        receiveTimeout: const Duration(seconds: 60),
        headers: {
          'Accept': 'application/json',
        },
      ),
    );
    _addErrorInterceptor(dio);
    return dio;
  }

  // 添加统一错误处理拦截器
  void _addErrorInterceptor(Dio dio) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException error, ErrorInterceptorHandler handler) {
          // 1. 网络层错误（客户端处理）
          switch (error.type) {
            case DioExceptionType.connectionTimeout:
            case DioExceptionType.sendTimeout:
            case DioExceptionType.receiveTimeout:
              handler.reject(
                DioException(
                  requestOptions: error.requestOptions,
                  error: '连接超时，请重试',
                  type: error.type,
                ),
              );
              return;

            case DioExceptionType.connectionError:
              handler.reject(
                DioException(
                  requestOptions: error.requestOptions,
                  error: '网络错误，请检查网络连接',
                  type: error.type,
                ),
              );
              return;

            case DioExceptionType.badResponse:
              // 继续处理业务错误
              break;

            default:
              handler.next(error);
              return;
          }

          // 2. 业务错误（服务端返回）
          if (error.response != null) {
            final data = error.response?.data;

            // 服务端返回了结构化错误 {error: {code, message}}
            if (data is Map && data.containsKey('error')) {
              final errorObj = data['error'];
              String message = errorObj['message'] ?? '未知错误';

              // TODO: 可选 - 根据error code进行国际化翻译
              // message = _translateError(errorObj['code'], message);

              handler.reject(
                DioException(
                  requestOptions: error.requestOptions,
                  error: message,
                  response: error.response,
                  type: error.type,
                ),
              );
              return;
            }

            // 服务端没有返回结构化错误，使用HTTP状态码fallback
            final statusCode = error.response?.statusCode;
            final fallbackMessage = _getStatusCodeMessage(statusCode);

            if (fallbackMessage != null) {
              handler.reject(
                DioException(
                  requestOptions: error.requestOptions,
                  error: fallbackMessage,
                  response: error.response,
                  type: error.type,
                ),
              );
              return;
            }
          }

          // 3. 其他未处理的错误，原样传递
          handler.next(error);
        },
      ),
    );
  }

  // HTTP状态码对应的通用错误消息
  String? _getStatusCodeMessage(int? statusCode) {
    switch (statusCode) {
      case 400:
        return '请求参数错误';
      case 401:
        return '未授权，请重新登录';
      case 403:
        return '无权访问';
      case 404:
        return '资源不存在';
      case 409:
        return '资源冲突';
      case 413:
        return '文件过大';
      case 415:
        return '不支持的文件类型';
      case 422:
        return '验证失败';
      case 500:
        return '服务器错误，请稍后重试';
      default:
        return null;
    }
  }

  // TODO: 可选 - 国际化翻译函数
  // String _translateError(String? code, String defaultMessage) {
  //   if (code == null) return defaultMessage;
  //
  //   // 从国际化文件读取翻译
  //   // 例如使用 easy_localization 或 flutter_i18n
  //   return defaultMessage;
  // }

  static _ApiService get instance {
    _instance ??= _ApiService._();
    return _instance!;
  }

  // Base服务器（默认）
  HttpClient get baseJsonClient => _baseJsonClient;
  HttpClient get baseUploadClient => _baseUploadClient;
  Dio get baseJsonDio => _baseJsonDio;
  Dio get baseUploadDio => _baseUploadDio;

  // Auth服务器
  HttpClient get authJsonClient => _authJsonClient;
  HttpClient get authUploadClient => _authUploadClient;
  Dio get authJsonDio => _authJsonDio;
  Dio get authUploadDio => _authUploadDio;

  // File服务器
  HttpClient get fileJsonClient => _fileJsonClient;
  HttpClient get fileUploadClient => _fileUploadClient;
  Dio get fileJsonDio => _fileJsonDio;
  Dio get fileUploadDio => _fileUploadDio;
}

// Global instances - Base服务器（默认）
final httpClient = _ApiService.instance.baseJsonClient;
final uploadClient = _ApiService.instance.baseUploadClient;
final dio = _ApiService.instance.baseJsonDio;
final uploadDio = _ApiService.instance.baseUploadDio;

// Global instances - Auth服务器
final authHttpClient = _ApiService.instance.authJsonClient;
final authUploadClient = _ApiService.instance.authUploadClient;
final authDio = _ApiService.instance.authJsonDio;
final authUploadDio = _ApiService.instance.authUploadDio;

// Global instances - File服务器
final fileHttpClient = _ApiService.instance.fileJsonClient;
final fileUploadClient = _ApiService.instance.fileUploadClient;
final fileDio = _ApiService.instance.fileJsonDio;
final fileUploadDio = _ApiService.instance.fileUploadDio;
