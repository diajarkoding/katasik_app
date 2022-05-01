import 'package:get/get.dart';
import '../../core/viewmodel/destination_viewmodel.dart';

class DestinationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DestinationViewModel>(
      () => DestinationViewModel(),
    );
  }
}
