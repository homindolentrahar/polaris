import 'package:get/get.dart';
import 'package:polaris/admin/presentation/application/analytics_controller.dart';
import 'package:polaris/admin/presentation/application/transactions_controller.dart';
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
