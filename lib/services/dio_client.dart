// lib/providers/dio_client.dart
import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient(this.dio);

  Future<void> login(String mobileNumber) async {
    try {
      final response = await dio.post(
        'http://localhost:8080/auth/login',
        data: {'mobile': mobileNumber},
      );
      // You can handle the response here if needed
      print('Login successful: ${response.data}');
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }
}

        // 'https://cheez-api-cba74d56272d.herokuapp.com/auth/login',

