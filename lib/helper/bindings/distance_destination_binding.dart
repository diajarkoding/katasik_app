import 'package:get/get.dart';

import '../../core/viewmodel/distance_destination_viewmodel.dart';

class DistanceDestinationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DistanceDestinationViewModel>(
      () => DistanceDestinationViewModel(),
    );
  }
}
