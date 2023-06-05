import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/admin/domain/models/beranda_summary_model.dart';
import 'package:polaris/core/data/repositories/analytics_repository.dart';
import 'package:polaris/core/data/repositories/events_repository.dart';
import 'package:polaris/core/domain/model/analytics.dart';
import 'package:polaris/core/domain/model/event.dart';

class HomeController extends GetxController {
  final EventsRepository eventRepository = EventsRepository();
  final AnalyticsRepository analyticsRepository = AnalyticsRepository();

  List<Event> recentEvents = List.empty();
  List<Analytics> totalAnalytics = List.empty();

  @override
  void onInit() {
    super.onInit();

    getRecentEvents();
    getTotalAnalytics();
  }

  Future<void> getRecentEvents() async {
    recentEvents = await eventRepository.getAllEvents();
    update();
  }

  Future<void> getTotalAnalytics() async {
    totalAnalytics = await analyticsRepository.getAllAnalytics();
    update();
  }

  List<HomeAnalyticsSummary> getAnalyticsSummary() {
    final totalViews = totalAnalytics.fold(
      0,
      (previousValue, element) => previousValue += element.views,
    );
    final totalClicks = totalAnalytics.fold(
      0,
      (previousValue, element) => previousValue += element.clicks,
    );
    final totalCtr = totalAnalytics.fold(
            0.0, (previousValue, element) => previousValue += element.ctr) /
        totalAnalytics.length;

    return [
      HomeAnalyticsSummary(
        icon: Iconsax.eye4,
        title: "Total Tampil",
        value: totalViews.toString(),
      ),
      HomeAnalyticsSummary(
        icon: Iconsax.mouse5,
        title: "Total Klik",
        value: totalClicks.toString(),
      ),
      HomeAnalyticsSummary(
        icon: Iconsax.electricity5,
        title: "CTR (Rata-rata)",
        value: "${totalCtr.toStringAsFixed(1)}%",
      ),
      HomeAnalyticsSummary(
        icon: Iconsax.calendar_15,
        title: "Total Event",
        value: recentEvents.length.toString(),
      ),
    ];
  }
}
