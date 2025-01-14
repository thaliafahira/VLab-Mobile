import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // Reactive variable to track the selected page index
  var selectedPageIndex = 0.obs;

  // Define pages
  final pages = [
    Center(
      child: Text(
        "Welcome to Virtual Lab Fisika",
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    ),
    Center(
      child: Text(
        "Gerak Parabola",
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    ),
  ];

  // Method to update the selected page index
  void changePage(int index) {
    selectedPageIndex.value = index;
  }
}
