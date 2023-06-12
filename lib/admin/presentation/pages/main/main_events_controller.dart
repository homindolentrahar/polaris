import 'package:get/get.dart';
import 'package:polaris/core/data/repositories/events_repository.dart';
import 'package:polaris/core/data/repositories/filters_repository.dart';
import 'package:polaris/core/domain/model/event.dart';
import 'package:polaris/core/domain/model/general.dart';

class MainEventsController extends GetxController {
  final EventsRepository eventsRepository = EventsRepository();
  final FiltersRepository filtersRepository = FiltersRepository();

  List<Event> events = List.empty();
  List<FilterSortData> filters = List.empty();
  List<FilterSortData> sorts = List.empty();
  FilterSortData? selectedFilter;
  FilterSortData? selectedSort;

  @override
  void onInit() {
    super.onInit();

    getAllEvents();
  }

  Future<void> getAllEvents() async {
    events = await eventsRepository.getAllEvents();
    filters = await filtersRepository.getFilters("events");
    sorts = await filtersRepository.getSorts("events");
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
