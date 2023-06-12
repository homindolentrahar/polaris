import 'package:get/get.dart';
import 'package:polaris/core/data/repositories/filters_repository.dart';
import 'package:polaris/core/domain/model/general.dart';

class SearchKeyController extends GetxController {
  final FiltersRepository filtersRepository = FiltersRepository();

  List<FilterSortData> filters = List.empty();

  @override
  void onInit() {
    super.onInit();

    getAllFilters();
  }

  Future<void> getAllFilters() async {
    filters = await filtersRepository.getFilters("search");
    update();
  }
}
