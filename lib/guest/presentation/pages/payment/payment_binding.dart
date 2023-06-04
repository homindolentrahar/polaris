import 'package:get/get.dart';
import 'package:polaris/guest/presentation/pages/payment/payment_controller.dart';

class PaymentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentController());
  }
}
