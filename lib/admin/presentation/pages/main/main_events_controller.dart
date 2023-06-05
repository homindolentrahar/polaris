import 'package:get/get.dart';
import 'package:polaris/core/data/repositories/events_repository.dart';
import 'package:polaris/core/domain/model/event.dart';
import 'package:polaris/core/domain/model/filter_event_model.dart';

class MainEventsController extends GetxController {
  final EventsRepository repository = EventsRepository();
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

  List<Event> events = List.empty();

  @override
  void onInit() {
    super.onInit();

    getAllEvents();
  }

  Future<void> getAllEvents() async {
    events = await repository.getAllEvents();
    update();
  }
}
