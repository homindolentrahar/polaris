import 'package:get/get.dart';
import 'package:polaris/admin/presentation/pages/create/create_event_controller.dart';

class CreateEventBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateEventController());
  }
}
