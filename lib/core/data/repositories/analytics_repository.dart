import 'package:polaris/core/domain/model/analytics.dart';
import 'package:polaris/core/util/helper/json_helper.dart';

class AnalyticsRepository {
  Future<List<Analytics>> getAllAnalytics() async {
    final List<dynamic> data = await JsonHelper.readJson("analytics");

    return data.map((e) => Analytics.fromJson(e)).toList();
  }
}
