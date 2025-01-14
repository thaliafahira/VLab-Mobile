import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import 'package:vlab_mobile/app/constant/color.dart';
import 'package:vlab_mobile/app/modules/gelombang_dan_bunyi/controllers/gelombang_dan_bunyi_controller.dart'; // Adjust your color import if needed

class GelombangDanBunyiView extends GetView<GelombangDanBunyiController> {
  const GelombangDanBunyiView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GelombangDanBunyiController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Simulasi Waves',
              style: TextStyle(
                fontSize: 28,
                color: VlabColors.birutua,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            // Amplitude Slider
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                        "Amplitudo: ${controller.amplitude.value.toInt()}"),
                  ),
                  Slider(
                    value: controller.amplitude.value,
                    min: 10,
                    max: 100,
                    divisions: 90,
                    thumbColor: VlabColors.birumuda,
                    activeColor: VlabColors.birumuda,
                    label: "${controller.amplitude.value.toInt()}",
                    onChanged: (value) {
                      controller.updateAmplitude(value);
                    },
                  ),
                ],
              ),
            ),

            // Frequency Slider
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                        "Frekuensi: ${controller.frequency.value.toStringAsFixed(2)}"),
                  ),
                  Slider(
                    value: controller.frequency.value,
                    min: 0.01,
                    max: 0.1,
                    divisions: 90,
                    thumbColor: VlabColors.birumuda,
                    activeColor: VlabColors.birumuda,
                    label: controller.frequency.value.toStringAsFixed(2),
                    onChanged: (value) {
                      controller.updateFrequency(value);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Canvas for simulation
            SizedBox(
              width: 400,
              height: 400,
              child: Obx(
                () => CustomPaint(
                  painter: WavePainter(
                    amplitude: controller.amplitude.value,
                    frequency: controller.frequency.value,
                    time: controller.time.value,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  final double amplitude;
  final double frequency;
  final double time;

  WavePainter({
    required this.amplitude,
    required this.frequency,
    required this.time,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();

    // Draw the wave, shifting by time to simulate motion
    for (double x = 0; x < size.width; x++) {
      final y = size.height / 2 +
          amplitude *
              math.sin(frequency * (x + time)); // Use time as phase shift
      if (x == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Redraw every time
  }
}
