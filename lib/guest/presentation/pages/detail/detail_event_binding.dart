import 'package:get/get.dart';
import 'package:polaris/guest/presentation/pages/detail/detail_event_controller.dart';

class DetailEventBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailEventController());
  }
}
