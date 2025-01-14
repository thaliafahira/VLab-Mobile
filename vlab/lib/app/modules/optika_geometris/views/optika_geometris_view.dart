import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vlab_mobile/app/constant/color.dart';

import '../controllers/optika_geometris_controller.dart';

class OptikaGeometrisView extends GetView<OptikaGeometrisController> {
  const OptikaGeometrisView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OptikaGeometrisController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Simulasi Optics',
              style: TextStyle(
                fontSize: 28,
                color: VlabColors.birutua,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                          "Jarak Benda (cm): ${controller.objectDistance.value.toInt()}"),
                    ),
                    Slider(
                      value: controller.objectDistance.value,
                      min: 10,
                      max: 100,
                      divisions: 90,
                      label: "${controller.objectDistance.value.toInt()} cm",
                      thumbColor: VlabColors.birumuda,
                      activeColor: VlabColors.birumuda,
                      onChanged: (value) {
                        controller.updateObjectDistance(value);
                      },
                    ),
                  ],
                )),
            Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                          "Jarak Fokus (cm): ${controller.focalLength.value.toInt()}"),
                    ),
                    Slider(
                      value: controller.focalLength.value,
                      min: 5,
                      max: 50,
                      label: "${controller.focalLength.value.toInt()} cm",
                      thumbColor: VlabColors.birumuda,
                      activeColor: VlabColors.birumuda,
                      onChanged: (value) {
                        controller.updateFocalLength(value);
                      },
                    ),
                  ],
                )),
            const SizedBox(height: 24),
            SizedBox(
              width: 400,
              height: 400,
              child: Obx(
                () => CustomPaint(
                  painter: OptikaPainter(
                    objectDistance: controller.objectDistance.value,
                    focalLength: controller.focalLength.value,
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

class OptikaPainter extends CustomPainter {
  final double objectDistance;
  final double focalLength;

  OptikaPainter({required this.objectDistance, required this.focalLength});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    final double scale = 5;

    // Calculate the image distance using lens formula
    final double o = objectDistance;
    final double f = focalLength;
    final double i = (f * o) / (o - f);

    // Draw optical axis
    paint.color = Colors.grey;
    paint.strokeWidth = 2;
    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      paint,
    );

    // Draw lens
    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;
    Path lensPath = Path();
    lensPath.moveTo(size.width / 2, size.height / 2 - 100);
    lensPath.quadraticBezierTo(size.width / 2 + 20, size.height / 2,
        size.width / 2, size.height / 2 + 100);
    lensPath.moveTo(size.width / 2, size.height / 2 - 100);
    lensPath.quadraticBezierTo(size.width / 2 - 20, size.height / 2,
        size.width / 2, size.height / 2 + 100);
    canvas.drawPath(lensPath, paint);

    // Draw object
    paint.color = Colors.blue;
    paint.strokeWidth = 3;
    canvas.drawLine(
      Offset(size.width / 2 - o * scale, size.height / 2),
      Offset(size.width / 2 - o * scale, size.height / 2 - 80),
      paint,
    );

    // Draw image
    paint.color = Colors.red;
    canvas.drawLine(
      Offset(size.width / 2 + i * scale, size.height / 2),
      Offset(size.width / 2 + i * scale, size.height / 2 - (i / o) * 80),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
