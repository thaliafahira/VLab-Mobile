import 'package:get/get.dart';

import '../controllers/bandul_sederhana_controller.dart';

class BandulSederhanaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BandulSederhanaController>(
      () => BandulSederhanaController(),
    );
  }
}
