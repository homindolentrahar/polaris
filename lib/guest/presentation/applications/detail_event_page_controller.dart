import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:polaris/guest/presentation/fragments/detail_event_info_fragment.dart';
import 'package:polaris/guest/presentation/fragments/detail_event_register_fragment.dart';

class DetailEventPageController extends GetxController {
  int tabIndex = 0;
  PageController pageController = PageController();
  final fragments = [
    {
      'title': "Info",
      'fragment': const DetailEventInfoFragment(),
    },
    {
      'title': "Pendaftaran",
      'fragment': const DetailEventRegisterFragment(),
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
