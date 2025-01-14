import 'package:get/get.dart';

class OptikaGeometrisController extends GetxController {
  var objectDistance = 20.0.obs; // Initial object distance in cm
  var focalLength = 15.0.obs; // Initial focal length in cm

  void updateObjectDistance(double value) {
    objectDistance.value = value;
  }

  void updateFocalLength(double value) {
    focalLength.value = value;
  }
}
