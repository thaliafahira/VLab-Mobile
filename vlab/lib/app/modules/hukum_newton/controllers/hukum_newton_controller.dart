import 'package:get/get.dart';
import 'dart:async';

class HukumNewtonController extends GetxController {
  var mass = 10.0.obs;
  var force = 50.0.obs;
  var position = 0.0.obs;

  Timer? _timer;

  void startSimulation() {
    _timer?.cancel();
    position.value = 0.0;
    double acceleration = force.value / mass.value;
    double velocity = 0;

    _timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      velocity += acceleration * 0.016; // Time delta in seconds
      position.value += velocity;

      if (position.value > 350) {
        // Stop when the block reaches the canvas edge
        timer.cancel();
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void forceUpdate(double value) {
    force.value = value;
    startSimulation();
  }

  void massUpdate(double value) {
    mass.value = value;
    startSimulation();
  }
}
