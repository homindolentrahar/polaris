import 'package:get/get.dart';
import 'package:polaris/auth/presentation/pages/verification/verification_controller.dart';

class VerificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerificationController());
  }
}
