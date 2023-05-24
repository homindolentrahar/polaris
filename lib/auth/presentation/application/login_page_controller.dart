import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  int tabIndex = 0;
  PageController pageController = PageController();
  List<String> titles = ["Email", "Handphone"];

  void onTabChanged(int index) {
    tabIndex = index;
    pageController.animateToPage(
      index,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 300),
    );
    update();
  }
}
