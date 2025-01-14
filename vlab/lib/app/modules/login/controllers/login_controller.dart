import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vlab_mobile/app/data/service/auth_service.dart';
import 'package:vlab_mobile/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool isPasswordHide = true.obs;

  Future<void> login() async {
    final String username = usernameController.text;
    final String password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Username and password are required.',
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
      );
      return;
    }

    try {
      isLoading.value = true;
      final authService = AuthService();
      final token = await authService.login(
        username: username,
        password: password,
      );
      Get.snackbar(
        'Success',
        'Login successful',
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
      );
      log('Received token: $token');
      Get.offAllNamed(Routes.DASHBOARD);
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
      );
    } finally {
      isLoading.value = false;
    }
  }

  void onPressedIconPassword() {
    isPasswordHide.value = !isPasswordHide.value;
  }
}
