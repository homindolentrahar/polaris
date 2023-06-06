import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:polaris/core/data/repositories/analytics_repository.dart';
import 'package:polaris/core/data/repositories/events_repository.dart';
import 'package:polaris/core/domain/model/analytic.dart';
import 'package:polaris/core/domain/model/event.dart';

class AnalyticsController extends GetxController {
  final EventsRepository eventsRepository = EventsRepository();
  final AnalyticsRepository analyticsRepository = AnalyticsRepository();

  Map<DateTime, List<Analytic>> totalAnalytics = {};
  List<Analytic> monthlyAnalytics = List.empty();
  List<Event> events = List.empty();

  @override
  void onInit() {
    super.onInit();

    getAllAnalytics();
  }

  Future<void> getAllAnalytics() async {
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
}
