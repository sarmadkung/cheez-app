import 'package:cheez/services/dio_client.dart';
import 'package:cheez/services/dio_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginState extends StateNotifier<AsyncValue<void>> {
  final DioClient _dioClient;

  LoginState(this._dioClient) : super(const AsyncData(null));

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    try {
      final response = await _dioClient.login(email, password);
      await _saveLoginToken(response['token']);  // Save token to local storage
      state = const AsyncData(null);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace); // Provide both error and stack trace
    }
  }

  Future<void> _saveLoginToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userToken', token);
  }
}

final loginStateProvider = StateNotifierProvider<LoginState, AsyncValue<void>>((ref) {
  final dioClient = ref.watch(dioClientProvider);
  return LoginState(dioClient);
});
