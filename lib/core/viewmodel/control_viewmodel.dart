import 'package:get/get.dart';

import '../../helper/routes/route_name.dart';

class ControlViewModel extends GetxController {
  RxInt currentIndex = 0.obs;

  // Rx<List<Destinasi>> foundDestinasi = Rx<List<Destinasi>>([]);

  void changeCurrentIndex(int index) async {
    currentIndex.value = index;

    switch (index) {
      case 0:
        Get.offAllNamed(Routes.homeView);
        break;
      case 1:
        Get.offAllNamed(Routes.mapView);
        break;
      case 2:
        Get.offAllNamed(Routes.distanceView);
        break;
      case 3:
        Get.offAllNamed(Routes.aboutView);

        break;
      default:
        Get.offAllNamed(Routes.homeView);
    }
  }
}
