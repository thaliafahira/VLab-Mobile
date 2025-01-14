import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vlab_mobile/app/constant/color.dart';

import '../controllers/bandul_sederhana_controller.dart';

class BandulSederhanaView extends GetView<BandulSederhanaController> {
  const BandulSederhanaView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BandulSederhanaController());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Simulasi Pendulum',
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
                        "Panjang Tali (px): ${controller.length.value.toInt()}"),
                  ),
                  Slider(
                    value: controller.length.value,
                    min: 100,
                    max: 300,
                    divisions: 100,
                    label: 'Length: ${controller.length.value.toInt()}px',
                    onChanged: (value) {
                      controller.length.value = value;
                    },
                    thumbColor: VlabColors.birumuda,
                    activeColor: VlabColors.birumuda,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Obx(() => Text(
                      "Sudut Peluncuran (°): ${(controller.initialAngle.value * 180 / pi).toStringAsFixed(1)}")),
                ),
                Obx(
                  () => Slider(
                    value: controller.initialAngle.value,
                    min: -pi / 2,
                    max: pi / 2,
                    divisions: 100,
                    label:
                        'Angle: ${(controller.initialAngle.value * 180 / pi).toStringAsFixed(1)}°',
                    onChanged: (value) {
                      controller.updateInitialAngle(value);
                    },
                    thumbColor: VlabColors.birumuda,
                    activeColor: VlabColors.birumuda,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 400,
              height: 400,
              child: Obx(() {
                return CustomPaint(
                  painter: PendulumPainter(
                    angle: controller.angle.value,
                    length: controller.length.value,
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class PendulumPainter extends CustomPainter {
  final double angle;
  final double length;

  PendulumPainter({required this.angle, required this.length});

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = 50.0;

    final x = centerX + length * sin(angle);
    final y = centerY + length * cos(angle);

    final paintRod = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    final paintBob = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    // Draw rod
    canvas.drawLine(Offset(centerX, centerY), Offset(x, y), paintRod);

    // Draw bob
    canvas.drawCircle(Offset(x, y), 20, paintBob);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
