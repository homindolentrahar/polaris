import 'package:get/get.dart';
import 'package:polaris/admin/presentation/pages/main/fragments/analytics_controller.dart';
import 'package:polaris/admin/presentation/pages/main/fragments/transactions_controller.dart';
import 'package:polaris/admin/presentation/pages/main/main_controller.dart';

import 'fragments/home_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
    Get.put(HomeController());
    Get.put(AnalyticsController());
    Get.put(TransactionsController());
  }
}
