import 'package:get/get.dart';
import 'package:polaris/admin/presentation/pages/detail/main_detail_event_controller.dart';

class MainDetailEventBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MainDetailEventController());
  }
}
