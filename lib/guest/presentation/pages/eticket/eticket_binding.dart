import 'package:get/get.dart';
import 'package:polaris/guest/presentation/pages/eticket/eticket_controller.dart';

class EticketBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EticketController());
  }
}
