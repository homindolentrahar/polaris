import 'package:get/get.dart';
import 'package:polaris/auth/presentation/pages/login/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
