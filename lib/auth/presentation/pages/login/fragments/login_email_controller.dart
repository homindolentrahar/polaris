import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:polaris/core/presentation/application/auth_controller.dart';
import 'package:polaris/core/util/constants/app_constants.dart';

class LoginEmailController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();

  void login() {
    if (formKey.currentState!.saveAndValidate()) {
      Get.find<AuthController>().saveAppMode(AppMode.admin);
    }
  }
}
