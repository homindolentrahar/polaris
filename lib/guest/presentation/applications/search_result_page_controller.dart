import 'package:get/get.dart';
import 'package:polaris/core/domain/model/filter_event_model.dart';

class SearchResultPageController extends GetxController {
  final List<FilterEventModel> filters = [
    FilterEventModel(
      value: 'nearby',
      title: "Terdekat",
    ),
    FilterEventModel(
      value: 'this_week',
      title: "Minggu Ini",
    ),
    FilterEventModel(
      value: 'ticket_limited',
      title: "Tiket Terbatas",
    ),
    FilterEventModel(
      value: 'ticket_ots',
      title: "Tiket OTS",
    ),
  ];
}
