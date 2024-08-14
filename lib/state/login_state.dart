// lib/state/login_state.dart
import 'package:cheez/services/dio_client.dart';
import 'package:cheez/services/dio_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginState extends StateNotifier<AsyncValue<void>> {
  final DioClient _dioClient;

  LoginState(this._dioClient) : super(const AsyncData(null));

  Future<void> login(String mobileNumber) async {
    state = const AsyncLoading();
    try {
      await _dioClient.login(mobileNumber);
      state = const AsyncData(null);
    } catch (e, stackTrace) {
      state = AsyncError(e, stackTrace); // Provide both error and stack trace
    }
  }
}


final loginStateProvider = StateNotifierProvider<LoginState, AsyncValue<void>>((ref) {
  final dioClient = ref.watch(dioClientProvider);
  return LoginState(dioClient);
});
