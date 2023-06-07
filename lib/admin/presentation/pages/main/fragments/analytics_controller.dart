import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:polaris/core/data/repositories/analytics_repository.dart';
import 'package:polaris/core/data/repositories/events_repository.dart';
import 'package:polaris/core/data/repositories/filters_repository.dart';
import 'package:polaris/core/domain/model/analytic.dart';
import 'package:polaris/core/domain/model/event.dart';
import 'package:polaris/core/domain/model/general.dart';

class AnalyticsController extends GetxController {
  final EventsRepository eventsRepository = EventsRepository();
  final AnalyticsRepository analyticsRepository = AnalyticsRepository();
  final FiltersRepository filtersRepository = FiltersRepository();

  Map<DateTime, List<Analytic>> totalAnalytics = {};
  List<Analytic> monthlyAnalytics = List.empty();
  List<Event> events = List.empty();
  List<FilterSortData> filters = List.empty();
  List<FilterSortData> sorts = List.empty();
  FilterSortData? selectedFilter;
  FilterSortData? selectedSort;
  DateTime filterDate = DateTime.now();

  @override
  void onInit() {
    super.onInit();

    getAllAnalytics();
  }

  Future<void> getAllAnalytics() async {
    filters = await filtersRepository.getFilters("analytics");
    sorts = await filtersRepository.getSorts("analytics");

    totalAnalytics = groupBy(
      await analyticsRepository.getAllAnalytics(),
      (e) => DateTime(DateTime.now().year, e.period.month),
    );
    monthlyAnalytics = (await analyticsRepository.getAllAnalytics())
        .where(
          (element) => element.period.month == DateTime.now().month,
        )
        .toList();

    final allEvents = await eventsRepository.getAllEvents();
    final monthlyEventIds = monthlyAnalytics.map((e) => e.eventId).toList();

    events = allEvents
        .where((element) => monthlyEventIds.contains(element.id))
        .toList();
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

  void onDateChanged(DateTime dateTime) {
    filterDate = dateTime;
    update();
  }
}
