import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:polaris/auth/presentation/fragments/login_email_fragment.dart';
import 'package:polaris/auth/presentation/fragments/login_phone_fragment.dart';

class LoginPageController extends GetxController {
  int tabIndex = 0;
  PageController pageController = PageController();
  final fragments = [
    {
      'title': "Email",
      'fragment': const LoginEmailFragment(),
    },
    {
      'title': "Phone",
      'fragment': const LoginPhoneFragment(),
    },
  ];

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
