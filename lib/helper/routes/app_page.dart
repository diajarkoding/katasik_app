import 'package:get/get.dart';
import 'package:katasik_app/helper/bindings/about_binding.dart';
import 'package:katasik_app/helper/bindings/destination_binding.dart';
import 'package:katasik_app/helper/bindings/nearest_destination_binding.dart';
import 'package:katasik_app/view/pages/about_view.dart';
import 'package:katasik_app/view/pages/nearest_destination_view.dart';
import 'package:katasik_app/view/pages/destination_view.dart';
import 'package:katasik_app/view/pages/home_view.dart';
import 'package:katasik_app/view/pages/map_view.dart';

import '../bindings/destination_binding.dart';
import '../bindings/map_binding.dart';
import 'route_name.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.homeView,
      page: () => const HomeView(),
      transition: Transition.fadeIn,
      bindings: [
        DestinationBinding(),
        NearestDestinationBinding(),
      ],
    ),
    GetPage(
      name: Routes.mapView,
      page: () => const MapView(),
      transition: Transition.fadeIn,
      binding: MapBinding(),
    ),
    GetPage(
      name: Routes.nearestDestinationView,
      page: () => const NearestDestinationView(),
      transition: Transition.fadeIn,
      bindings: [
        DestinationBinding(),
        NearestDestinationBinding(),
      ],
    ),
    GetPage(
        name: Routes.aboutView,
        page: () => AboutView(),
        transition: Transition.fadeIn,
        bindings: [
          AboutBinding(),
          DestinationBinding(),
        ]),
    GetPage(
      name: Routes.destinationView,
      page: () => const DestinationView(),
      bindings: [
        DestinationBinding(),
        NearestDestinationBinding(),
      ],
    ),
  ];
}
