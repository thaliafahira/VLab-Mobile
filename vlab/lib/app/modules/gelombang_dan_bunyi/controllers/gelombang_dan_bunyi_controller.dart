import 'dart:async';
import 'package:get/get.dart';
import 'dart:math' as math;

class GelombangDanBunyiController extends GetxController {
  var amplitude = 50.0.obs;
  var frequency = 0.02.obs;
  var time = 0.0.obs;

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _startAnimation(); // Start the animation when the controller is initialized
  }

  void _startAnimation() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      incrementTime(); // Continuously update time
    });
  }

  void updateAmplitude(double value) {
    amplitude.value =
        value; // Update amplitude, no need to restart the animation
  }

  void updateFrequency(double value) {
    frequency.value =
        value; // Update frequency, no need to restart the animation
    _startAnimation();
  }

  void incrementTime() {
    time.value += 0.01; // Continuously increment time for animation
  }

  double getWavePosition(double x) {
    return amplitude.value * math.sin(frequency.value * x + time.value);
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
