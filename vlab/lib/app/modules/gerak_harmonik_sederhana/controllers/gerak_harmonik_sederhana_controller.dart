import 'dart:async';
import 'dart:math';
import 'package:get/get.dart';

class GerakHarmonikSederhanaController extends GetxController {
  final amplitude = 100.0.obs; // Amplitudo (px)
  final frequency = 0.05.obs; // Frekuensi (Hz)
  final position = 0.0.obs; // Posisi (x)
  Timer? _timer; // Timer untuk animasi
  double _time = 0.0; // Waktu
  static const double fixedSpeed = 0.03; // Fix speed for consistent animation

  @override
  void onInit() {
    super.onInit();
    // Mulai Timer untuk animasi
    _startSimulation();
  }

  void _startSimulation() {
    _timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      double deltaTime = 16 / 1000.0; // 16 milliseconds per frame

      // Increment time by a fixed step size to maintain constant speed
      _time += deltaTime * fixedSpeed;

      // Calculate position using amplitude and frequency
      position.value = amplitude.value * sin(2 * pi * frequency.value * _time);
    });
  }

  void updateAmplitute(double value) {
    amplitude.value = value;
    _startSimulation();
  }

  void updateFrequency(double value) {
    frequency.value = value;
    _startSimulation();
  }

  @override
  void onClose() {
    _timer?.cancel(); // Hentikan Timer saat tidak diperlukan
    super.onClose();
  }
}
