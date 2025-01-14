import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vlab_mobile/app/constant/color.dart';

import '../controllers/gerak_harmonik_sederhana_controller.dart';

class GerakHarmonikSederhanaView
    extends GetView<GerakHarmonikSederhanaController> {
  const GerakHarmonikSederhanaView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GerakHarmonikSederhanaController());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Simulasi Harmonik',
              style: TextStyle(
                fontSize: 28,
                color: VlabColors.birutua,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                        "Amplitudo: ${controller.amplitude.value.toInt().toString()}"),
                  ),
                  Slider(
                    value: controller.amplitude.value,
                    min: 10,
                    max: 200,
                    label: controller.amplitude.value.toInt().toString(),
                    onChanged: (value) {
                      controller.updateAmplitute(value);
                    },
                    thumbColor: VlabColors.birumuda,
                    activeColor: VlabColors.birumuda,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                        "Frekuensi: ${controller.frequency.value.toStringAsFixed(2)}"),
                  ),
                  Slider(
                    value: controller.frequency.value,
                    min: 0.01,
                    max: 0.1,
                    // divisions: 1000,
                    label: controller.frequency.value.toInt().toString(),
                    onChanged: (value) {
                      controller.updateFrequency(value);
                    },
                    thumbColor: VlabColors.birumuda,
                    activeColor: VlabColors.birumuda,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 400,
              height: 400,
              child: Obx(
                () {
                  return CustomPaint(
                    painter: HarmonicPainter(
                      position: controller.position.value,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HarmonicPainter extends CustomPainter {
  final double position;

  HarmonicPainter({required this.position});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    // Gambar bola bergerak
    final center = Offset(size.width / 2 + position, size.height / 2);
    canvas.drawCircle(center, 20, paint);
  }

  @override
  bool shouldRepaint(covariant HarmonicPainter oldDelegate) {
    return oldDelegate.position != position;
  }
}
