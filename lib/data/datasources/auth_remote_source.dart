import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/api/api_client.dart';
import '../../core/api/api_endpoints.dart';
import '../models/user/login_response.dart';
import '../models/user/user_profile.dart';

final authRemoteSourceProvider = Provider<AuthRemoteSource>((ref) {
  return AuthRemoteSource(ref.read(dioProvider));
});

class AuthRemoteSource {
  final Dio _dio;
  AuthRemoteSource(this._dio);

  Future<LoginResponse> login(String email, String password) async {
    final response = await _dio.post(
      ApiEndpoints.login,
      queryParameters: {'username': email, 'password': password},
    );
    return LoginResponse.fromJson(response.data);
  }

  Future<void> logout() async {
    await _dio.post(ApiEndpoints.logout);
  }

  Future<void> register({
    required String email,
    required String password,
    required String code,
  }) async {
    await _dio.post(ApiEndpoints.register, data: {
      'email': email,
      'password': password,
      'code': code,
    });
  }

  Future<void> sendVerifyCode(String email) async {
    await _dio.post(ApiEndpoints.verifyCode, data: {'email': email});
  }

  Future<void> sendResetPasswordEmail(String email) async {
    await _dio.put(ApiEndpoints.resetPasswordEmail, data: {'email': email});
  }

  Future<void> resetPassword({
    required String email,
    required String token,
    required String password,
  }) async {
    await _dio.put(ApiEndpoints.resetPassword, data: {
      'email': email,
      'token': token,
      'password': password,
    });
  }

  Future<UserProfile> getProfile() async {
    final response = await _dio.get(ApiEndpoints.userProfile);
    return UserProfile.fromJson(response.data);
  }

  Future<String> uploadAvatar(String filePath) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(filePath, filename: 'avatar.jpg'),
    });
    final response = await _dio.put(
      ApiEndpoints.updateAvatar,
      data: formData,
    );
    // Returns {avatarUrl: "https://..."}
    return (response.data as Map)['avatarUrl']?.toString() ?? '';
  }
}
