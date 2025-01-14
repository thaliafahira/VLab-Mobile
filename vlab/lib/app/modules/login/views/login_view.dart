import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vlab_mobile/app/constant/color.dart';
import 'package:vlab_mobile/app/constant/font.dart';
import 'package:vlab_mobile/app/routes/app_pages.dart';
import 'package:vlab_mobile/app/widgets/custom_button.dart';
import 'package:vlab_mobile/app/widgets/custom_header.dart';
import 'package:vlab_mobile/app/widgets/custom_text_field.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomHeader(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: boldText32,
                  ),
                  const SizedBox(height: 28),
                  CustomTextField(
                    label: '',
                    hintText: 'Username',
                    controller: controller.usernameController,
                  ),
                  const SizedBox(height: 28),
                  Obx(
                    () => CustomTextField(
                        label: '',
                        hintText: 'Password',
                        controller: controller.passwordController,
                        isPassword: true,
                        isPasswordHide: controller.isPasswordHide.value,
                        onPressedIconPassword: () {
                          controller.onPressedIconPassword();
                        }),
                  ),
                  const SizedBox(height: 28),
                  Obx(
                    () => CustomButton(
                      text: 'Login',
                      onTap: () {
                        controller.login();
                      },
                      isLoading: controller.isLoading.value,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Belum punya akun?',
                        style: TextStyle(
                          fontSize: 14,
                          color: VlabColors.neutralColors[0],
                        ),
                      ),
                      TextButton(
                        onPressed: () => Get.offAllNamed(Routes.REGISTER),
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all(
                            const EdgeInsets.all(4),
                          ),
                          minimumSize: WidgetStateProperty.all(
                            const Size(50, 25),
                          ),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: VlabColors.birumuda,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
