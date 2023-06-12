import 'package:get/get.dart';
import 'package:polaris/core/data/repositories/filters_repository.dart';
import 'package:polaris/core/data/repositories/transactions_repository.dart';
import 'package:polaris/core/domain/model/general.dart';
import 'package:polaris/core/domain/model/transaction.dart';

class TransactionsController extends GetxController {
  final TransactionsRepository repository = TransactionsRepository();
  final FiltersRepository filtersRepository = FiltersRepository();

  List<Transaction> transactions = List.empty();
  List<FilterSortData> filters = List.empty();
  List<FilterSortData> sorts = List.empty();
  FilterSortData? selectedFilter;
  FilterSortData? selectedSort;

  @override
  void onInit() {
    super.onInit();

    getAllTransactions();
  }

  Future<void> getAllTransactions() async {
    transactions = await repository.getAllTransactions();
    filters = await filtersRepository.getFilters("transactions");
    sorts = await filtersRepository.getSorts("transactions");
    update();
  }

  void onFilterSelected(FilterSortData filter) {
    if (selectedFilter?.id == filter.id) {
      selectedFilter = null;
    } else {
      selectedFilter = filter;
    }
    update();
  }

  void onSortSelected(FilterSortData filter) {
    selectedSort = filter;
    update();
  }

  void clearSelectedSort() {
    selectedSort = null;
    update();
  }
}
