import 'package:get/get.dart';

import '../controllers/gerak_harmonik_sederhana_controller.dart';

class GerakHarmonikSederhanaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GerakHarmonikSederhanaController>(
      () => GerakHarmonikSederhanaController(),
    );
  }
}
