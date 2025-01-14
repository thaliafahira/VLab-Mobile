import 'package:get/get.dart';

import '../controllers/gerak_parabola_controller.dart';

class GerakParabolaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GerakParabolaController>(
      () => GerakParabolaController(),
    );
  }
}
