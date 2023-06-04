import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:polaris/route/app_route.dart';

class LoginPhoneController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();

  void login() {
    if (formKey.currentState!.saveAndValidate()) {
      final phone = formKey.currentState!.value['phone'];

      Get.toNamed(
        AppRoutes.otp,
        arguments: phone,
      );
    }
  }
}
