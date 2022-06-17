import 'package:get/get.dart';
import 'package:katasik_app/core/viewmodel/nearest_destination_viewmodel.dart';

class NearestDestinationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NearestDestinationViewModel>(
      () => NearestDestinationViewModel(),
    );
  }
}
