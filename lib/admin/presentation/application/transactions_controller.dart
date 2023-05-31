import 'package:get/get.dart';
import 'package:polaris/core/domain/model/filter_event_model.dart';

class TransactionsController extends GetxController {
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
