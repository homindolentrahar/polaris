import 'package:get/get.dart';

class FormAmountFieldController extends GetxController {
  FormAmountFieldController(int initialAmount) {
    amount = initialAmount;
  }

  int amount = 0;

  void onAmountChanged(int amount) {
    this.amount = amount;
    update();
  }

  void decreaseAmount() {
    amount -= 1;
    update();
  }

  void increaseAmount() {
    amount += 1;
    update();
  }
}
