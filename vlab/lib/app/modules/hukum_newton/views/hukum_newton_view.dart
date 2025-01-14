import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vlab_mobile/app/constant/color.dart';
import 'package:vlab_mobile/app/modules/hukum_newton/controllers/hukum_newton_controller.dart';

class HukumNewtonView extends GetView<HukumNewtonController> {
  const HukumNewtonView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HukumNewtonController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Simulasi Newton',
              style: TextStyle(
                fontSize: 28,
                color: VlabColors.birutua,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),

            // Mass control slider
            Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child:
                          Text("Massa (kg): ${controller.mass.value.toInt()}"),
                    ),
                    Slider(
                      value: controller.mass.value,
                      min: 1,
                      max: 10,
                      // divisions: 9,
                      label: "${controller.mass.value.toInt()} kg",
                      thumbColor: VlabColors.birumuda,
                      activeColor: VlabColors.birumuda,
                      onChanged: (value) {
                        controller.massUpdate(value);
                      },
                    ),
                  ],
                )),
            // Force control slider
            Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child:
                          Text("Gaya (N): ${controller.force.value.toInt()}"),
                    ),
                    Slider(
                      value: controller.force.value,
                      min: 1,
                      max: 100,
                      divisions: 99,
                      label: "${controller.force.value.toInt()} N",
                      thumbColor: VlabColors.birumuda,
                      activeColor: VlabColors.birumuda,
                      onChanged: (value) {
                        controller.forceUpdate(value);
                      },
                    ),
                  ],
                )),
            // Canvas for simulation
            SizedBox(
              width: 400,
              height: 400,
              child: Obx(
                () {
                  return CustomPaint(
                    painter: NewtonSimulationPainter(
                      mass: controller.mass.value,
                      force: controller.force.value,
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

class NewtonSimulationPainter extends CustomPainter {
  final double mass;
  final double force;
  final double position;

  NewtonSimulationPainter({
    required this.mass,
    required this.force,
    required this.position,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = Colors.orange;
    final double boxSize = 50;

    // Draw the moving block
    canvas.drawRect(
      Rect.fromLTWH(position, size.height / 2 - boxSize / 2, boxSize, boxSize),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
