import 'dart:math';
import 'package:get/get.dart';

class Particle {
  double x, y, vx, vy;

  Particle({required this.x, required this.y, required this.vx, required this.vy});
}

class HukumTermodinamikaController extends GetxController {
  final RxDouble temperature = 300.0.obs;
  final RxList<Particle> particles = <Particle>[].obs;
  final int particleCount = 50;

  late final double canvasWidth, canvasHeight;
  late final Random random;

  @override
  void onInit() {
    random = Random();
    _initializeParticles();
    super.onInit();
  }

  void updateTemperature(double value) {
    temperature.value = value;
    _updateParticleSpeeds();
  }

  void _initializeParticles() {
    for (int i = 0; i < particleCount; i++) {
      particles.add(
        Particle(
          x: random.nextDouble() * 400,
          y: random.nextDouble() * 400,
          vx: (random.nextDouble() - 0.5) * _calculateSpeed(),
          vy: (random.nextDouble() - 0.5) * _calculateSpeed(),
        ),
      );
    }
    _animateParticles();
  }

  double _calculateSpeed() => sqrt(temperature.value) / 2;

  void _updateParticleSpeeds() {
    for (var particle in particles) {
      particle.vx = (random.nextDouble() - 0.5) * _calculateSpeed();
      particle.vy = (random.nextDouble() - 0.5) * _calculateSpeed();
    }
    particles.refresh();
  }

  void _animateParticles() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 16)); // ~60 FPS
      _updateParticlePositions();
      return true;
    });
  }

  void _updateParticlePositions() {
    for (var particle in particles) {
      particle.x += particle.vx;
      particle.y += particle.vy;

      if (particle.x <= 0 || particle.x >= 400) particle.vx *= -1;
      if (particle.y <= 0 || particle.y >= 400) particle.vy *= -1;
    }
    particles.refresh();
  }
}
