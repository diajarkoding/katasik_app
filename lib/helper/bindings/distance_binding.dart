import 'package:get/get.dart';

import '../../core/viewmodel/distance_viewmodel.dart';

class DistanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DistanceViewModel>(
      () => DistanceViewModel(),
    );
  }
}
