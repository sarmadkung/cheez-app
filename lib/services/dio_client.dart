import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient(this.dio);

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await dio.post(
        'http://localhost:8080/auth/login',
        data: {'email': email, 'password': password},
      );
      return response.data; // Return the response containing the token
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }
}
