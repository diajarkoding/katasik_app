import 'package:get/get.dart';
import 'package:katasik_app/helper/bindings/about_binding.dart';
import 'package:katasik_app/helper/bindings/destination_binding.dart';
import 'package:katasik_app/view/pages/about_view.dart';
import 'package:katasik_app/view/pages/distance_destination_view.dart';
import 'package:katasik_app/view/pages/destination_view.dart';
import 'package:katasik_app/view/pages/handle_location.dart';
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
      binding: DestinationBinding(),
    ),
    GetPage(
      name: Routes.mapView,
      page: () => const MapView(),
      transition: Transition.fadeIn,
      binding: MapBinding(),
    ),
    GetPage(
      name: Routes.distanceDestinationView,
      page: () => const DistanceDestinationView(),
      transition: Transition.fadeIn,
      bindings: [
        DestinationBinding(),
      ],
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
      bindings: [
        DestinationBinding(),
      ],
    ),
    GetPage(
      name: Routes.handleLocation,
      page: () => const HandleLocation(),
    )
    //   bindings: [
    //     DestinationBinding(),
    //   ],
    // ),
  ];
}
