import 'package:get/get.dart';
import 'package:polaris/admin/domain/models/analytics_model.dart';
import 'package:polaris/core/domain/model/filter_event_model.dart';

class TransactionsController extends GetxController {
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
}
