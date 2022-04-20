import 'package:get/get.dart';

import '../../core/viewmodel/about_viewmodel.dart';

class AboutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutViewModel>(
      () => AboutViewModel(),
    );
  }
}
