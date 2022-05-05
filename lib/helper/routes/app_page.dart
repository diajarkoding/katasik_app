import 'package:get/get.dart';
import 'package:katasik_app/helper/bindings/about_binding.dart';
import 'package:katasik_app/helper/bindings/calculate_distance_binding.dart';
import 'package:katasik_app/helper/bindings/destination_binding.dart';
import 'package:katasik_app/view/pages/about_view.dart';
import 'package:katasik_app/view/pages/calculate_distance_view.dart';
import 'package:katasik_app/view/pages/destination_view.dart';
import 'package:katasik_app/view/pages/detail_destination_view.dart';
import 'package:katasik_app/view/pages/home_view.dart';
import 'package:katasik_app/view/pages/map_view.dart';

import '../bindings/home_binding.dart';
import '../bindings/map_binding.dart';
import 'route_name.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.homeView,
      page: () => const HomeView(),
      transition: Transition.fadeIn,
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.mapView,
      page: () => const MapView(),
      transition: Transition.fadeIn,
      binding: MapBinding(),
    ),
    GetPage(
      name: Routes.calculateDistanceView,
      page: () => const CalculateDistanceView(),
      transition: Transition.fadeIn,
      binding: DistanceBinding(),
    ),
    GetPage(
      name: Routes.aboutView,
      page: () => const AboutView(),
      transition: Transition.fadeIn,
      binding: AboutBinding(),
    ),
    GetPage(
      name: Routes.destinationView,
      page: () => const DestinationView(),
      binding: DestinationBinding(),
    ),
    // GetPage(
    //   name: Routes.splashPage,
    //   page: () => SplashPage(),
    //   binding: SplashBinding(),
    // ),
    GetPage(
      name: Routes.detailDestinationView,
      page: () => const DetailDestinaionView(),
      // binding: HomeBinding(),
    ),
  ];
}
