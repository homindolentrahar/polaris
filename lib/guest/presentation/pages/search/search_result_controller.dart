import 'package:get/get.dart';
import 'package:polaris/core/data/repositories/events_repository.dart';
import 'package:polaris/core/domain/model/event.dart';

class SearchResultController extends GetxController {
  final EventsRepository repository = EventsRepository();

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
