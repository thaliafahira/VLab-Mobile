import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';

// class BandulSederhanaController extends GetxController {
//   RxDouble angle = (pi / 4).obs;
//   RxDouble length = 200.0.obs;
//   final double gravity = 9.8;
//   final double damping = 0.999;
//   RxDouble initialAngle = (pi / 4).obs;
//   RxDouble angularVelocity = 0.0.obs;

//   Timer? _timer;

//   void startSimulation() {
//     angle.value = initialAngle.value;
//     angularVelocity.value = 0;

//     _timer = Timer.periodic(Duration(milliseconds: 16), (timer) {
//       final angularAcceleration =
//           (-1 * gravity / length.value) * sin(angle.value);
//       angularVelocity.value += angularAcceleration;
//       angularVelocity.value *= damping;
//       angle.value += angularVelocity.value;
//     });
//   }

//   void stopSimulation() {
//     _timer?.cancel();
//   }

//   void updateInitialAngle(double value) {
//     initialAngle.value = value;
//   }

//   @override
//   void onClose() {
//     stopSimulation();
//     super.onClose();
//   }
// }
class BandulSederhanaController extends GetxController {
  RxDouble angle = (pi / 4).obs;
  RxDouble length = 200.0.obs;
  final double gravity = 9.8;
  final double damping = 0.999;
  RxDouble initialAngle = (pi / 4).obs;
  RxDouble angularVelocity = 0.0.obs;

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startSimulation();
  }

  void startSimulation() {
    if (_timer == null) {
      angle.value = initialAngle.value;
      angularVelocity.value = 0;

      _timer = Timer.periodic(Duration(milliseconds: 16), (timer) {
        final angularAcceleration =
            (-1 * gravity / length.value) * sin(angle.value);
        angularVelocity.value += angularAcceleration;
        angularVelocity.value *= damping;
        angle.value += angularVelocity.value;
      });
    }
  }

  void stopSimulation() {
    _timer?.cancel();
    _timer = null;
  }

  void updateInitialAngle(double value) {
    initialAngle.value = value;
    stopSimulation();
    startSimulation();
  }

  @override
  void onClose() {
    stopSimulation();
    super.onClose();
  }
}
