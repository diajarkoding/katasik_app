import 'package:get/get.dart';
import 'package:katasik_app/view/pages/about_view.dart';
import 'package:katasik_app/view/pages/distance_view.dart';
import 'package:katasik_app/view/pages/home_view.dart';
import 'package:katasik_app/view/pages/map_view.dart';

import 'route_name.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.homeView,
      page: () => const HomeView(),
      transition: Transition.fadeIn,
      // binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.mapView,
      page: () => const MapView(),
      transition: Transition.fadeIn,
      // binding: MapBinding(),
    ),
    GetPage(
      name: Routes.distanceView,
      page: () => const DistanceView(),
      transition: Transition.fadeIn,
      // binding: SearchBinding(),
    ),
    GetPage(
      name: Routes.aboutView,
      page: () => const AboutView(),
      transition: Transition.fadeIn,
      // binding: UserBinding(),
    ),
    // GetPage(
    //   name: Routes.allDestinationPage,
    //   page: () => const AllDestinasi(),
    //   // binding: AllDe(),
    // ),
    // GetPage(
    //   name: Routes.splashPage,
    //   page: () => SplashPage(),
    //   binding: SplashBinding(),
    // ),
    // GetPage(
    //   name: Routes.detailPage,
    //   page: () =>  DetailPage(destinasi: ,),
    //   binding: HomeBinding(),
    // ),
  ];
}
