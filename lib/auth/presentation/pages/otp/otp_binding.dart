import 'package:get/get.dart';
import 'package:polaris/auth/presentation/pages/otp/otp_controller.dart';

class OtpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtpController());
  }
}
