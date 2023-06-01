import 'package:get/get.dart';
import 'package:polaris/core/util/constants/app_constants.dart';
import 'package:polaris/core/util/helper/storage_helper.dart';

class AppController extends GetxController {
  Future<void> saveAppMode(AppMode mode) async {
    await StorageHelper.instance.write(
      key: AppConstants.appModeKey,
      value: mode.name,
    );
  }

  Future<void> removeAppMode() async {
    await StorageHelper.instance.remove(AppConstants.appModeKey);
  }
}
