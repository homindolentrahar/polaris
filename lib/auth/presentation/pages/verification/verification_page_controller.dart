import 'package:get/get.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:polaris/core/presentation/application/app_controller.dart';
import 'package:polaris/core/util/constants/app_constants.dart';
import 'package:polaris/route/app_route.dart';

class VerificationPageController extends GetxController {
  Future<void> checkEmail() async {
    await OpenMailApp.openMailApp();
  }

  void skipVerification() {
    Get.find<AppController>().saveAppMode(AppMode.admin);

    Get.offAllNamed(
      AppRoutes.admin,
      arguments: false,
    );
  }
}
