import 'package:get/get.dart';
import 'package:polaris/auth/presentation/pages/login/fragments/login_phone_controller.dart';

class LoginPhoneBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginPhoneController());
  }
}
