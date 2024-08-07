import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;

  DioClient()
      : _dio = Dio(
          BaseOptions(
             baseUrl: 'http://localhost:8080',
            connectTimeout: Duration(milliseconds: 5000),
            receiveTimeout: Duration(milliseconds: 3000),
          ),
        );

  Dio get dio => _dio;
}
