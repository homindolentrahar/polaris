import 'package:get/get.dart';
import 'package:polaris/auth/presentation/pages/login/fragments/login_email_controller.dart';

class LoginEmailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginEmailController());
  }
}
