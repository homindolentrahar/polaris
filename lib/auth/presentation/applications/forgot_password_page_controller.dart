import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class ForgotPasswordPageController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  int tick = 0;
  bool isResubmit = false;
  Timer? timer;

  void submit() {
    if (formKey.currentState!.saveAndValidate()) {
      timer?.cancel();

      isResubmit = true;
      tick = 60;
      update();
      timer = Timer.periodic(
        const Duration(seconds: 1),
        (t) {
          if (tick >= 1) {
            tick -= 1;
            update();
          }
        },
      );
    }
  }
}
