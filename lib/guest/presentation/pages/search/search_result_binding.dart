import 'package:get/get.dart';
import 'package:polaris/guest/presentation/pages/search/search_result_controller.dart';

class SearchResultBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchResultController());
  }
}
