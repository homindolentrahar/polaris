import 'package:polaris/core/domain/model/event.dart';
import 'package:polaris/core/util/helper/json_helper.dart';

class EventsRepository {
  Future<List<Event>> getAllEvents() async {
    final List<dynamic> data = await JsonHelper.readJson("events");

    return data.map((e) => Event.fromJson(e)).toList();
  }

  Future<Event> getSingleEvent(String id) async {
    final List<dynamic> data = await JsonHelper.readJson("events");
    final List<Event> events = data.map((e) => Event.fromJson(e)).toList();

    return events.firstWhere((element) => element.id == id);
  }
}
