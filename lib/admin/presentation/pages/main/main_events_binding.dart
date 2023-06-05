import 'package:get/get.dart';
import 'package:polaris/admin/presentation/pages/main/main_events_controller.dart';

class MainEventsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainEventsController());
  }
}
