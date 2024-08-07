// providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'dio_client.dart';

// Dio provider
final dioProvider = Provider<Dio>((ref) {
  final dioClient = DioClient();
  return dioClient.dio;
});

final userProvider = FutureProvider.autoDispose<List<dynamic>>((ref) async {
  final dio = ref.read(dioProvider);
  final response = await dio.get('/users');
  return response.data;
});
