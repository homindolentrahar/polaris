import 'package:get/get.dart';

class FormPasswordFieldController extends GetxController {
  bool isObscure = true;

  void toggleObscureText() {
    isObscure = !isObscure;
    update();
  }
}
