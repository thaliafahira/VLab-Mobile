import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vlab_mobile/app/constant/color.dart';
import 'package:vlab_mobile/app/constant/font.dart';
import 'package:vlab_mobile/app/routes/app_pages.dart';
import 'package:vlab_mobile/app/widgets/custom_button.dart';
import 'package:vlab_mobile/app/widgets/custom_header.dart';
import 'package:vlab_mobile/app/widgets/custom_text_field.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

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
                    'Register',
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
                      },
                    ),
                  ),
                  const SizedBox(height: 28),
                  Obx(
                    () => CustomButton(
                      text: 'Register',
                      onTap: () {
                        controller.register();
                      },
                      isLoading: controller.isLoading.value,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sudah punya akun?',
                        style: TextStyle(
                          fontSize: 14,
                          color: VlabColors.neutralColors[0],
                        ),
                      ),
                      TextButton(
                        onPressed: () => Get.offAllNamed(Routes.LOGIN),
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
                          'Login',
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
