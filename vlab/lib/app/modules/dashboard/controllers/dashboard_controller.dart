import 'package:get/get.dart';
import 'package:vlab_mobile/app/modules/bandul_sederhana/views/bandul_sederhana_view.dart';
import 'package:vlab_mobile/app/modules/gelombang_dan_bunyi/views/gelombang_dan_bunyi_view.dart';
import 'package:vlab_mobile/app/modules/gerak_harmonik_sederhana/views/gerak_harmonik_sederhana_view.dart';
import 'package:vlab_mobile/app/modules/gerak_parabola/views/gerak_parabola_view.dart';
import 'package:vlab_mobile/app/modules/home/views/home_view.dart';
import 'package:vlab_mobile/app/modules/hukum_newton/views/hukum_newton_view.dart';
import 'package:vlab_mobile/app/modules/hukum_termodinamika/views/hukum_termodinamika_view.dart';
import 'package:vlab_mobile/app/modules/optika_geometris/views/optika_geometris_view.dart';

class DashboardController extends GetxController {
  var selectedPageIndex = 0.obs;

  final pages = [
    HomeView(),
    GerakParabolaView(),
    BandulSederhanaView(),
    GerakHarmonikSederhanaView(),
    HukumNewtonView(),
    HukumTermodinamikaView(),
    OptikaGeometrisView(),
    GelombangDanBunyiView()
  ];

  void changePage(int index) {
    selectedPageIndex.value = index;
  }
}
