import 'package:get/get.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:polaris/route/app_route.dart';

class VerificationPageController extends GetxController {
  Future<void> checkEmail() async {
    // Open Email App
    await OpenMailApp.openMailApp();
  }

  void skipVerification() {
    Get.offNamed(AppRoutes.admin);
  }
}
