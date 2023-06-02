import 'package:get/get.dart';
import 'package:polaris/core/domain/model/filter_event_model.dart';

class SearchKeyController extends GetxController {
  final List<FilterEventModel> filters = [
    FilterEventModel(
      value: 'musik',
      title: "Musik",
    ),
    FilterEventModel(
      value: 'bernyanyi_berdendang',
      title: "Bernyanyi Berdendang",
    ),
    FilterEventModel(
      value: 'workshop',
      title: "Workshop",
    ),
    FilterEventModel(
      value: 'data_science',
      title: "Data Science",
    ),
    FilterEventModel(
      value: 'charity',
      title: "Charity",
    ),
    FilterEventModel(
      value: 'jejepangan',
      title: "Jejepangan",
    ),
  ];
}
