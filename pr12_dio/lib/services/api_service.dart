import 'package:dio/dio.dart';

// Твій піддомен на requestcatcher.com
const String requestCatcherSubdomain = 'dianak-lab12';

class ApiService {
  ApiService()
      : _dio = Dio(
    BaseOptions(
      baseUrl: 'https://$requestCatcherSubdomain.requestcatcher.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  final Dio _dio;

  Future<void> login(String email, String password) {
    return _post('/login', {'email': email, 'password': password});
  }

  Future<void> signUp(String name, String email, String password) {
    return _post('/signup', {
      'name': name,
      'email': email,
      'password': password,
    });
  }

  Future<void> resetPassword(String email) {
    return _post('/reset', {'email': email});
  }

  // dio сам кидає DioException, якщо запит не вдався
  Future<void> _post(String path, Map<String, dynamic> data) async {
    await _dio.post(path, data: data);
  }
}