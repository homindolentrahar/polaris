import 'package:get/get.dart';
import 'package:polaris/core/util/constants/app_constants.dart';
import 'package:polaris/core/util/helper/storage_helper.dart';
import 'package:polaris/route/app_route.dart';

class LoaderPageController extends GetxController {
  LoaderPageController() {
    Future.delayed(
      const Duration(milliseconds: 3000),
      () {
        final appMode = StorageHelper.instance.read(AppConstants.appModeKey);

        if (appMode != null) {
          Get.offAllNamed(
            appMode == AppMode.admin.name ? AppRoutes.admin : AppRoutes.guest,
          );
        } else {
          Get.offAllNamed(AppRoutes.landing);
        }
      },
    );
  }
}
