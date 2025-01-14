import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vlab_mobile/app/constant/color.dart';
import 'package:vlab_mobile/app/constant/font.dart';
import 'package:vlab_mobile/app/data/service/auth_service.dart';
import 'package:vlab_mobile/app/routes/app_pages.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'V-',
                style: boldText20.copyWith(color: Colors.white),
              ),
              TextSpan(
                text: 'lab Fisika',
                style: boldText20.copyWith(color: VlabColors.kuning),
              ),
            ],
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                VlabColors.birutua,
                VlabColors.birumuda,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              final authService = AuthService();
              await authService.logout();
              Get.offAllNamed(Routes.LOGIN);
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("Bihurin Salsabila Firdaus"),
              accountEmail: const Text("18222015"),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Icon(
                    Icons.person_2_rounded,
                    size: 45,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    VlabColors.birutua,
                    VlabColors.birumuda,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Home',
                style: boldText18.copyWith(color: VlabColors.birutua),
              ),
              onTap: () {
                controller.changePage(0);
                Get.back();
              },
            ),
            ListTile(
              title: Text(
                'Gerak Parabola',
                style: boldText18.copyWith(color: VlabColors.birutua),
              ),
              onTap: () {
                controller.changePage(1);
                Get.back();
              },
            ),
            ListTile(
              title: Text(
                'Bandul Sederhana',
                style: boldText18.copyWith(color: VlabColors.birutua),
              ),
              onTap: () {
                controller.changePage(2);
                Get.back();
              },
            ),
            ListTile(
              title: Text(
                'Gerak Harmonik Sederhana',
                style: boldText18.copyWith(color: VlabColors.birutua),
              ),
              onTap: () {
                controller.changePage(3);
                Get.back();
              },
            ),
            ListTile(
              title: Text(
                'Hukum Newton',
                style: boldText18.copyWith(color: VlabColors.birutua),
              ),
              onTap: () {
                controller.changePage(4);
                Get.back();
              },
            ),
            ListTile(
              title: Text(
                'Hukum Termodinamika',
                style: boldText18.copyWith(color: VlabColors.birutua),
              ),
              onTap: () {
                controller.changePage(5);
                Get.back();
              },
            ),
            ListTile(
              title: Text(
                'Optika Geometris',
                style: boldText18.copyWith(color: VlabColors.birutua),
              ),
              onTap: () {
                controller.changePage(6);
                Get.back();
              },
            ),
            ListTile(
              title: Text(
                'Gelombang dan Bunyi',
                style: boldText18.copyWith(color: VlabColors.birutua),
              ),
              onTap: () {
                controller.changePage(7);
                Get.back();
              },
            ),
          ],
        ),
      ),
      body: Obx(
        // Observe changes in the selected page index
        () => AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: controller.pages[controller.selectedPageIndex.value],
        ),
      ),
    );
  }
}
