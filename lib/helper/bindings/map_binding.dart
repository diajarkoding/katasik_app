import 'package:get/get.dart';

import '../../core/viewmodel/map_viewmodel.dart';

class MapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapViewModel>(
      () => MapViewModel(),
    );
  }
}
