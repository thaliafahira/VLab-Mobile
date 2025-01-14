import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const baseUrl = 'https://pawm-final-be-production.up.railway.app/';

class AuthService {
  final Dio dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    headers: {
      'Content-Type': 'application/json',
    },
  ));

  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  Future<String> register({
    required String username,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        '/register',
        data: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 201) {
        return response.data['message'];
      } else {
        throw Exception('Failed to register');
      }
    } catch (e) {
      throw Exception('Error during registration: $e');
    }
  }

  Future<String> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        '/login',
        data: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        String token = response.data['token'];
        await _secureStorage.write(key: 'token', value: token);

        return token;
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw Exception('Error during login: $e');
    }
  }

  Future<void> logout() async {
    try {
      await _secureStorage.delete(key: 'token');
      log('User logged out successfully');
    } catch (e) {
      throw Exception('Error during logout: $e');
    }
  }

  Future<bool> isLoggedIn() async {
    String? token = await _secureStorage.read(key: 'token');
    return token != null;
  }

  Future<String?> getToken() async {
    return await _secureStorage.read(key: 'token');
  }
}
