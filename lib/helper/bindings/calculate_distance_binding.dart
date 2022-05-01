import 'package:get/get.dart';

import '../../core/viewmodel/calculate_distance_viewmodel.dart';

class DistanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DistanceViewModel>(
      () => DistanceViewModel(),
    );
  }
}
