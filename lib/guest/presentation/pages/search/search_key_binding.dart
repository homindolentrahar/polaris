import 'package:get/get.dart';
import 'package:polaris/guest/presentation/pages/search/search_key_controller.dart';

class SearchKeyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchKeyController());
  }
}
