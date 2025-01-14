import 'package:get/get.dart';

import '../controllers/hukum_termodinamika_controller.dart';

class HukumTermodinamikaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HukumTermodinamikaController>(
      () => HukumTermodinamikaController(),
    );
  }
}
