import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vlab_mobile/app/constant/color.dart';
import '../controllers/gerak_parabola_controller.dart';

class GerakParabolaView extends GetView<GerakParabolaController> {
  const GerakParabolaView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GerakParabolaController());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Simulasi Projectile',
              style: TextStyle(
                fontSize: 28,
                color: VlabColors.birutua,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Obx(() => Text(
                      "Sudut Peluncuran (°): ${controller.launchAngle.value.toInt().toString()}")),
                ),
                Obx(
                  () => Slider(
                    value: controller.launchAngle.value,
                    min: 0,
                    max: 90,
                    divisions: 90,
                    label: controller.launchAngle.value.toInt().toString(),
                    thumbColor: VlabColors.birumuda,
                    activeColor: VlabColors.birumuda,
                    onChangeEnd: (value) {
                      controller.startSimulation();
                    },
                    onChanged: (value) {
                      controller.updateAngle(value);
                    },
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Obx(() => Text(
                      "Kecepatan Awal (m/s): ${controller.initialVelocity.value.toInt().toString()}")),
                ),
                Obx(
                  () => Slider(
                    value: controller.initialVelocity.value,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: controller.initialVelocity.value.toInt().toString(),
                    thumbColor: VlabColors.birumuda,
                    activeColor: VlabColors.birumuda,
                    onChangeEnd: (value) {
                      controller.startSimulation();
                    },
                    onChanged: (value) {
                      controller.updateVelocity(value);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 400,
              width: 400,
              child: Obx(
                () => CustomPaint(
                  painter: ProjectilePainter(
                    projectilePosition: controller.projectilePosition.value,
                    trajectoryPoints: controller.trajectoryPoints,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class ProjectilePainter extends CustomPainter {
  final Offset projectilePosition;
  final List<Offset> trajectoryPoints;

  ProjectilePainter({
    required this.projectilePosition,
    required this.trajectoryPoints,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final projectilePaint = Paint()
      ..color = VlabColors.birumuda
      ..style = PaintingStyle.fill;

    final trajectoryPaint = Paint()
      ..color = Colors.transparent
      ..strokeWidth = 2;

    // Draw trajectory points
    for (int i = 1; i < trajectoryPoints.length; i++) {
      final start = trajectoryPoints[i - 1];
      final end = trajectoryPoints[i];
      canvas.drawLine(
        Offset(start.dx, size.height - start.dy),
        Offset(end.dx, size.height - end.dy),
        trajectoryPaint,
      );
    }

    // Draw projectile
    if (projectilePosition.dy <= size.height) {
      canvas.drawCircle(
        Offset(projectilePosition.dx, size.height - projectilePosition.dy),
        10,
        projectilePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
