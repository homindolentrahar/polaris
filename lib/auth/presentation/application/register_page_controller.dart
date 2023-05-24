import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class RegisterPageController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();

  void register() {
    if (formKey.currentState!.saveAndValidate()) {}
  }
}
