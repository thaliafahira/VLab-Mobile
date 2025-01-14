import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vlab_mobile/app/constant/color.dart';
import 'package:vlab_mobile/app/data/service/auth_service.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(MainApp());
}

Future<String> checkLoginStatus() async {
  final authService = AuthService();
  bool isLoggedIn = await authService.isLoggedIn();

  return isLoggedIn ? '/dashboard' : '/login';
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: checkLoginStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show loading indicator while checking the login status
          return Container(
            color: Colors.white,
            child: Center(
                child: CircularProgressIndicator(
              color: VlabColors.birutua,
            )),
          );
        }
        if (snapshot.hasError) {
          return Container(
            color: Colors.white,
            child: Center(child: Text("Error: ${snapshot.error}")),
          );
        }
        return GetMaterialApp(
          title: "Application",
          initialRoute: snapshot.data,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
