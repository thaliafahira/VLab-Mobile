// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../modules/bandul_sederhana/bindings/bandul_sederhana_binding.dart';
import '../modules/bandul_sederhana/views/bandul_sederhana_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/gelombang_dan_bunyi/bindings/gelombang_dan_bunyi_binding.dart';
import '../modules/gelombang_dan_bunyi/views/gelombang_dan_bunyi_view.dart';
import '../modules/gerak_harmonik_sederhana/bindings/gerak_harmonik_sederhana_binding.dart';
import '../modules/gerak_harmonik_sederhana/views/gerak_harmonik_sederhana_view.dart';
import '../modules/gerak_parabola/bindings/gerak_parabola_binding.dart';
import '../modules/gerak_parabola/views/gerak_parabola_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/hukum_newton/bindings/hukum_newton_binding.dart';
import '../modules/hukum_newton/views/hukum_newton_view.dart';
import '../modules/hukum_termodinamika/bindings/hukum_termodinamika_binding.dart';
import '../modules/hukum_termodinamika/views/hukum_termodinamika_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/optika_geometris/bindings/optika_geometris_binding.dart';
import '../modules/optika_geometris/views/optika_geometris_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.REGISTER;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.GERAK_PARABOLA,
      page: () => const GerakParabolaView(),
      binding: GerakParabolaBinding(),
    ),
    GetPage(
      name: _Paths.BANDUL_SEDERHANA,
      page: () => const BandulSederhanaView(),
      binding: BandulSederhanaBinding(),
    ),
    GetPage(
      name: _Paths.GERAK_HARMONIK_SEDERHANA,
      page: () => const GerakHarmonikSederhanaView(),
      binding: GerakHarmonikSederhanaBinding(),
    ),
    GetPage(
      name: _Paths.HUKUM_NEWTON,
      page: () => const HukumNewtonView(),
      binding: HukumNewtonBinding(),
    ),
    GetPage(
      name: _Paths.HUKUM_TERMODINAMIKA,
      page: () => const HukumTermodinamikaView(),
      binding: HukumTermodinamikaBinding(),
    ),
    GetPage(
      name: _Paths.OPTIKA_GEOMETRIS,
      page: () => const OptikaGeometrisView(),
      binding: OptikaGeometrisBinding(),
    ),
    GetPage(
      name: _Paths.GELOMBANG_DAN_BUNYI,
      page: () => const GelombangDanBunyiView(),
      binding: GelombangDanBunyiBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
  ];
}
