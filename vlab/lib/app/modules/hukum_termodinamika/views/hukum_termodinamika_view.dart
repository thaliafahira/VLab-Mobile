import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vlab_mobile/app/constant/color.dart';

import '../controllers/hukum_termodinamika_controller.dart';

class HukumTermodinamikaView extends GetView<HukumTermodinamikaController> {
  const HukumTermodinamikaView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(HukumTermodinamikaController());
    return GetBuilder<HukumTermodinamikaController>(
      init: HukumTermodinamikaController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Simulasi Thermodynamics',
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
                            "Temperatur (K): ${controller.temperature.value.toInt()}"),
                      ),
                      Slider(
                        value: controller.temperature.value,
                        min: 100,
                        max: 500,
                        divisions: 400,
                        label: "${controller.temperature.value.toInt()} K",
                        thumbColor: VlabColors.birumuda,
                        activeColor: VlabColors.birumuda,
                        onChanged: (value) {
                          controller.updateTemperature(value);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: 400,
                  height: 400,
                  child: Obx(
                    () => CustomPaint(
                      painter: ThermodynamicsPainter(
                        controller.particles.toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ThermodynamicsPainter extends CustomPainter {
  final List<Particle> particles;

  ThermodynamicsPainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.fill;

    for (var particle in particles) {
      canvas.drawCircle(Offset(particle.x, particle.y), 5, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
