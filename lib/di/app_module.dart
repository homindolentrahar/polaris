import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:polaris/core/util/constants/app_constants.dart';

abstract class AppModule {
  static void inject() {
    Get.put<GetStorage>(
      GetStorage(AppConstants.appStorage),
      tag: AppConstants.appStorage,
    );
  }
}
