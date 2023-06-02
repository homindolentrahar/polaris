import 'package:polaris/core/domain/model/event.dart';
import 'package:polaris/core/util/helper/json_helper.dart';

class EventsRepository {
  Future<List<Event>> getAllEvents() async {
    final List<dynamic> events = await JsonHelper.readJson("events");

    return events.map((e) => Event.fromJson(e)).toList();
  }
}
