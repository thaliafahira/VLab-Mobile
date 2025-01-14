import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vlab_mobile/app/constant/color.dart';
import 'package:vlab_mobile/app/constant/font.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: const Color(0xff333333),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Virtual Lab Fisika",
                style: boldText32.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8.0),
              Text(
                "Virtual Lab Fisika adalah platform inovatif yang digunakan sebagai media pembelajaran dan praktikum fisika berbasis digital. Platform ini menyediakan berbagai simulasi interaktif untuk membantu memahami konsep fisika dengan lebih mudah dan menyenangkan.",
                style: regularText16.copyWith(color: Colors.white),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16.0),
              TextButton(
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  backgroundColor: WidgetStatePropertyAll(VlabColors.kuning),
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Text(
                  "Mulai Belajar",
                  style: semiBoldText16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
