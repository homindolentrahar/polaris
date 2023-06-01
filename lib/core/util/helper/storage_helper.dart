import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:polaris/core/util/constants/app_constants.dart';

class StorageHelper {
  late GetStorage _storage;

  static StorageHelper instance = StorageHelper._();

  StorageHelper._() {
    _storage = Get.find<GetStorage>(tag: AppConstants.appStorage);
  }

  Future<void> write({required String key, required dynamic value}) {
    return _storage.write(key, value);
  }

  T? read<T>(String key) {
    return _storage.read(key);
  }

  Future<void> remove(String key) {
    return _storage.remove(key);
  }

  void listenBox({
    required String key,
    required ValueChanged<dynamic> onListen,
  }) {
    _storage.listenKey(
      key,
      (value) => onListen(value),
    );
  }
}
