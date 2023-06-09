import 'package:get/get.dart';
import 'package:polaris/guest/presentation/pages/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
