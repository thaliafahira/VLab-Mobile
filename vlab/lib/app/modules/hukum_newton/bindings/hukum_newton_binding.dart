import 'package:get/get.dart';

import '../controllers/hukum_newton_controller.dart';

class HukumNewtonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HukumNewtonController>(
      () => HukumNewtonController(),
    );
  }
}
