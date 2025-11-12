import 'package:capsula_flutter/models/auth/change_password_request.dart';
import 'package:capsula_flutter/models/auth/login_request.dart';
import 'package:capsula_flutter/models/auth/login_response.dart';
import 'package:capsula_flutter/models/auth/register_request.dart';
import 'package:capsula_flutter/models/auth/reset_password_request.dart';
import 'package:capsula_flutter/services/http/api_service.dart';

/// Login with email and password
Future<LoginResponse> login(LoginRequest request) async {
  final response = await authHttpClient.post(
    '/auth/login',
    data: request.toJson(),
  );
  return LoginResponse.fromJson(response.data);
}

/// Register new user
Future<LoginResponse> register(RegisterRequest request) async {
  final response = await authHttpClient.post(
    '/auth/register',
    data: request.toJson(),
  );
  return LoginResponse.fromJson(response.data);
}

/// Logout
Future<void> logout() async {
  await authHttpClient.post('/auth/logout');
}

/// Refresh access token
Future<LoginResponse> refreshToken(String refreshToken) async {
  final response = await authHttpClient.post(
    '/auth/refresh',
    data: {'refreshToken': refreshToken},
  );
  return LoginResponse.fromJson(response.data);
}

/// Forgot password
Future<void> forgotPassword(String email) async {
  await authHttpClient.post('/auth/forgot-password', data: {'email': email});
}

/// Reset password
Future<void> resetPassword(ResetPasswordRequest request) async {
  await authHttpClient.post('/auth/reset-password', data: request.toJson());
}

/// Verify email
Future<void> verifyEmail(String token) async {
  await authHttpClient.post('/auth/verify-email', data: {'token': token});
}

/// Change password
Future<void> changePassword(ChangePasswordRequest request) async {
  await authHttpClient.post('/auth/change-password', data: request.toJson());
}
