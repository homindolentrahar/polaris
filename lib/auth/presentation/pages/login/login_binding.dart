import 'package:get/get.dart';
import 'package:polaris/auth/presentation/pages/login/fragments/login_email_controller.dart';
import 'package:polaris/auth/presentation/pages/login/fragments/login_phone_controller.dart';
import 'package:polaris/auth/presentation/pages/login/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.put(LoginEmailController());
    Get.put(LoginPhoneController());
  }
}
