import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:polaris/route/app_route.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();

  void register() {
    if (formKey.currentState!.saveAndValidate()) {
      final email = formKey.currentState!.value['email'];

      Get.toNamed(
        AppRoutes.verification,
        arguments: email,
      );
    }
  }
}
