import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/storage/secure_storage.dart';
import '../../../core/api/api_client.dart';
import '../../../data/datasources/auth_remote_source.dart';
import '../../../data/models/user/user_profile.dart';

enum AuthStatus { initial, unauthenticated, loading, authenticated, error }

class AuthState {
  final AuthStatus status;
  final UserProfile? user;
  final String? errorMessage;

  const AuthState({
    this.status = AuthStatus.initial,
    this.user,
    this.errorMessage,
  });

  bool get isLoggedIn => status == AuthStatus.authenticated;

  AuthState copyWith({
    AuthStatus? status,
    UserProfile? user,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage,
    );
  }
}

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(
    ref.read(secureStorageProvider),
    ref.read(authRemoteSourceProvider),
  );
});

class AuthNotifier extends StateNotifier<AuthState> {
  final SecureStorage _storage;
  final AuthRemoteSource _remoteSource;

  AuthNotifier(this._storage, this._remoteSource)
      : super(const AuthState(status: AuthStatus.initial));

  void forceUnauthenticated() {
    state = const AuthState(status: AuthStatus.unauthenticated);
  }

  Future<void> refreshProfile() async {
    try {
      final profile = await _remoteSource.getProfile();
      state = AuthState(status: AuthStatus.authenticated, user: profile);
    } catch (_) {}
  }

  Future<void> checkSession() async {
    try {
      final hasToken = await _storage.hasToken();
      if (!hasToken) {
        state = const AuthState(status: AuthStatus.unauthenticated);
        return;
      }
      try {
        final profile = await _remoteSource.getProfile();
        state = AuthState(status: AuthStatus.authenticated, user: profile);
      } catch (_) {
        await _storage.clearToken();
        state = const AuthState(status: AuthStatus.unauthenticated);
      }
    } catch (_) {
      // If secure storage itself fails, go to login
      state = const AuthState(status: AuthStatus.unauthenticated);
    }
  }

  Future<void> login(String email, String password) async {
    state = const AuthState(status: AuthStatus.loading);
    try {
      final response = await _remoteSource.login(email, password);
      if (response.accessToken != null) {
        await _storage.saveToken(response.accessToken!);
        final profile = await _remoteSource.getProfile();
        state = AuthState(status: AuthStatus.authenticated, user: profile);
      } else {
        state = const AuthState(
          status: AuthStatus.error,
          errorMessage: 'Login failed',
        );
      }
    } catch (e) {
      state = AuthState(
        status: AuthStatus.error,
        errorMessage: _parseError(e),
      );
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required String code,
  }) async {
    state = const AuthState(status: AuthStatus.loading);
    try {
      await _remoteSource.register(email: email, password: password, code: code);
      state = const AuthState(
        status: AuthStatus.authenticated,
      );
    } catch (e) {
      state = AuthState(
        status: AuthStatus.error,
        errorMessage: _parseError(e),
      );
    }
  }

  Future<bool> sendVerifyCode(String email) async {
    try {
      await _remoteSource.sendVerifyCode(email);
      return true;
    } catch (e) {
      state = AuthState(
        status: AuthStatus.error,
        errorMessage: _parseError(e),
      );
      return false;
    }
  }

  Future<void> sendResetPasswordEmail(String email) async {
    try {
      await _remoteSource.sendResetPasswordEmail(email);
    } catch (e) {
      state = AuthState(
        status: AuthStatus.error,
        errorMessage: _parseError(e),
      );
    }
  }

  Future<void> logout() async {
    try {
      await _remoteSource.logout();
    } catch (_) {}
    await _storage.clearToken();
    state = const AuthState(status: AuthStatus.unauthenticated);
  }

  String _parseError(dynamic error) {
    // DioException wraps the HTTP error response
    if (error is DioException) {
      final data = error.response?.data;
      if (data is Map && data.containsKey('detail')) {
        return data['detail'].toString();
      }
      if (data is Map && data.containsKey('message')) {
        return data['message'].toString();
      }
    }
    if (error is Map && error.containsKey('detail')) {
      return error['detail'].toString();
    }
    return error.toString();
  }
}
