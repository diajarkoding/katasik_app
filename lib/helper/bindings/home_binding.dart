import 'package:get/get.dart';
import 'package:katasik_app/core/viewmodel/home_viewmodel.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeViewModel>(
      () => HomeViewModel(),
    );
  }
}
