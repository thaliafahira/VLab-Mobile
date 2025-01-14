import 'package:get/get.dart';

import '../controllers/gelombang_dan_bunyi_controller.dart';

class GelombangDanBunyiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GelombangDanBunyiController>(
      () => GelombangDanBunyiController(),
    );
  }
}
