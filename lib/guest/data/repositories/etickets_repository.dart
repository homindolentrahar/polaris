import 'package:polaris/core/util/helper/json_helper.dart';
import 'package:polaris/guest/domain/models/eticket.dart';

class EticketsRepository {
  Future<List<Eticket>> getAllTickets() async {
    final List<dynamic> data = await JsonHelper.readJson("etickets");

    return data.map((e) => Eticket.fromJson(e)).toList();
  }
}
