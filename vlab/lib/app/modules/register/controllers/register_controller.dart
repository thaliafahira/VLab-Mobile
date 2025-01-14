import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vlab_mobile/app/data/service/auth_service.dart';
import 'package:vlab_mobile/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool isLoading = false.obs;
  RxBool isPasswordHide = true.obs;

  Future<void> register() async {
    final String username = usernameController.text;
    final String password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'username and password are required.',
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
      final message = await authService.register(
        username: username,
        password: password,
      );
      Get.snackbar(
        'Success',
        message,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
      );
      Get.offAllNamed(Routes.LOGIN);
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
