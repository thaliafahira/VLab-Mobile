// import 'dart:async';
// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class GerakParabolaController extends GetxController {
//   // Reactive variables for the slider values
//   var launchAngle = 45.0.obs; // Default angle (in degrees)
//   var initialVelocity = 50.0.obs; // Default velocity (in m/s)
//   var projectilePosition =
//       Offset(0, 0).obs; // Reactive position for the projectile
//   var trajectoryPoints = <Offset>[].obs; // Reactive trajectory points

//   final double gravity = 9.8; // Gravity constant
//   final double scale = 5; // Scaling factor for the simulation

//   Timer? _timer; // Timer for animation
//   double time = 0; // Time variable for simulation

//   void startSimulation() {
//     // Reset parameters
//     time = 0;
//     projectilePosition.value = Offset(0, 0);
//     trajectoryPoints.clear();

//     _timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
//       final angle = launchAngle.value * pi / 180; // Convert angle to radians
//       final speed = initialVelocity.value;
//       final x = speed * cos(angle) * time; // Calculate horizontal position
//       final y = speed * sin(angle) * time -
//           0.5 * gravity * time * time; // Calculate vertical position

//       if (y >= 0) {
//         projectilePosition.value =
//             Offset(x * scale, y * scale); // Update projectile position
//         trajectoryPoints
//             .add(projectilePosition.value); // Save the trajectory point
//         time += 0.1; // Increment time
//       } else {
//         timer
//             .cancel(); // Stop the simulation when the projectile hits the ground
//       }
//     });
//   }

//   @override
//   void onClose() {
//     _timer?.cancel();
//     super.onClose();
//   }

//   void updateVelocity(double value) {
//     initialVelocity.value = value;
//     startSimulation();
//   }

//   void updateAngle(double value) {
//     launchAngle.value = value;
//     startSimulation();
//   }
// }
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GerakParabolaController extends GetxController {
  // Reactive variables for the slider values
  var launchAngle = 45.0.obs; // Default angle (in degrees)
  var initialVelocity = 50.0.obs; // Default velocity (in m/s)
  var projectilePosition =
      Offset(0, 0).obs; // Reactive position for the projectile
  var trajectoryPoints = <Offset>[].obs; // Reactive trajectory points

  final double gravity = 9.8; // Gravity constant
  final double scale = 5; // Scaling factor for the simulation

  Timer? _timer; // Timer for animation
  double time = 0; // Time variable for simulation

  void startSimulation() {
    // Reset parameters
    time = 0;
    projectilePosition.value = Offset(0, 0);
    trajectoryPoints.clear();

    _timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      final angle = launchAngle.value * pi / 180; // Convert angle to radians
      final speed = initialVelocity.value;
      final x = speed * cos(angle) * time; // Calculate horizontal position
      final y = speed * sin(angle) * time -
          0.5 * gravity * time * time; // Calculate vertical position

      if (y >= 0) {
        projectilePosition.value =
            Offset(x * scale, y * scale); // Update projectile position
        trajectoryPoints
            .add(projectilePosition.value); // Save the trajectory point
        time += 0.1; // Increment time
      } else {
        timer
            .cancel(); // Stop the simulation when the projectile hits the ground
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void updateVelocity(double value) {
    initialVelocity.value = value;
    // startSimulation();
  }

  void updateAngle(double value) {
    launchAngle.value = value;
    // startSimulation();
  }
}
