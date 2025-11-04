import 'package:dio/dio.dart';
import 'http_client.dart';

class ApiService {
  final HttpClient _httpClient = HttpClient(Dio());

  ApiService();

  Future<Response> fetchPosts() async {
    return _httpClient.get('https://jsonplaceholder.typicode.com/posts');
  }

  // 其他 API 方法...
}
