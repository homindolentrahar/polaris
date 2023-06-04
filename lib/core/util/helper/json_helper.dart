import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:polaris/core/util/helper/log_helper.dart';

abstract class JsonHelper {
  static Future<dynamic> readJson(String file) async {
    final response = await rootBundle.loadString('assets/jsons/$file.json');
    final data = await json.decode(response);

    LogHelper.instance.debug("Result: $data");

    return data;
  }
}
