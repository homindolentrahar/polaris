import 'package:get/get.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:polaris/core/presentation/application/auth_controller.dart';
import 'package:polaris/core/util/constants/app_constants.dart';

class VerificationController extends GetxController {
  Future<void> checkEmail() async {
    await OpenMailApp.openMailApp();
  }

  void skipVerification() {
    Get.find<AuthController>().saveAppMode(AppMode.admin);
  }
}
