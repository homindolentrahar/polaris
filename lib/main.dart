import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:polaris/app.dart';
import 'package:polaris/core/util/constants/app_constants.dart';
import 'package:polaris/di/app_module.dart';

void main() async {
  initializeDateFormatting();

  await GetStorage.init(
    AppConstants.appStorage,
  );

  runApp(const PolarisApp());
}

void injectAppModules() {
  AppModule.inject();
}
