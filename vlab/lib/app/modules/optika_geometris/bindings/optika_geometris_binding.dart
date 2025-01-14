import 'package:get/get.dart';

import '../controllers/optika_geometris_controller.dart';

class OptikaGeometrisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OptikaGeometrisController>(
      () => OptikaGeometrisController(),
    );
  }
}
