import 'package:polaris/core/domain/model/analytics.dart';
import 'package:polaris/core/util/helper/json_helper.dart';

class AnalyticsRepository {
  Future<List<Analytic>> getAllAnalytics() async {
    final List<dynamic> data = await JsonHelper.readJson("analytics");

    return data.map((e) => Analytic.fromJson(e)).toList();
  }
}
