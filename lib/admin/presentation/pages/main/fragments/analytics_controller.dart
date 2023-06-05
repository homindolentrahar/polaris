import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:polaris/admin/domain/models/analytics_model.dart';
import 'package:polaris/core/data/repositories/analytics_repository.dart';
import 'package:polaris/core/data/repositories/events_repository.dart';
import 'package:polaris/core/domain/model/analytics.dart';
import 'package:polaris/core/domain/model/event.dart';
import 'package:polaris/core/domain/model/filter_event_model.dart';

class AnalyticsController extends GetxController {
  final EventsRepository eventsRepository = EventsRepository();
  final AnalyticsRepository analyticsRepository = AnalyticsRepository();

  final List<AnalyticsModel> analytics = [
    AnalyticsModel(
      title: "Jan",
      views: 58,
      clicks: 43,
      ctr: 10,
    ),
    AnalyticsModel(
      title: "Feb",
      views: 90,
      clicks: 67,
      ctr: 20,
    ),
    AnalyticsModel(
      title: "Mar",
      views: 67,
      clicks: 56,
      ctr: 80,
    ),
    AnalyticsModel(
      title: "Apr",
      views: 89,
      clicks: 75,
      ctr: 88,
    ),
    AnalyticsModel(
      title: "Mei",
      views: 45,
      clicks: 40,
      ctr: 90,
    ),
  ];
  final List<FilterEventModel> filters = [
    FilterEventModel(
      value: 'ctr_greater_50',
      title: "CTR > 50%",
    ),
    FilterEventModel(
      value: 'sold_out',
      title: "Tiket Habis",
    ),
  ];

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
