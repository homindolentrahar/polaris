import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polaris/auth/presentation/pages/login/fragments/login_email_fragment.dart';
import 'package:polaris/auth/presentation/pages/login/fragments/login_phone_fragment.dart';
import 'package:polaris/route/app_route.dart';

class LoginController extends GetxController {
  final PageController pageController = PageController();
  final fragments = [
    {
      'route': AppRoutes.email,
      'title': "Email",
      'fragment': const LoginEmailFragment(),
    },
    {
      'route': AppRoutes.phone,
      'title': "Phone",
      'fragment': const LoginPhoneFragment(),
    },
  ];

  int tabIndex = 0;

  void onTabChanged(int index) {
    tabIndex = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    update();
  }
}
