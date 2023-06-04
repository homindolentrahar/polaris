import 'package:get/get.dart';
import 'package:polaris/core/presentation/pages/loader/loader_controller.dart';

class LoaderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoaderController());
  }
}
