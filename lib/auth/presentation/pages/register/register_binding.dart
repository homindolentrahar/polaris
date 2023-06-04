import 'package:get/get.dart';
import 'package:polaris/auth/presentation/pages/register/register_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
