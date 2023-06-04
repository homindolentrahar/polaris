import 'package:get/get.dart';
import 'package:polaris/core/presentation/application/auth_controller.dart';

class LoaderController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Get.put(AuthController(), permanent: true);
  }
}
