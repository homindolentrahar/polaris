import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/core/domain/model/navigation_item_model.dart';

class AdminHomePageController extends GetxController {
  final List<NavigationItemModel> navItems = [
    NavigationItemModel(
      index: 0,
      title: "Home",
      icon: Icon(Iconsax.home_1, color: Get.theme.colorScheme.tertiary),
      activeIcon: Icon(Iconsax.home_15, color: Get.theme.primaryColor),
    ),
    NavigationItemModel(
      index: 1,
      title: "Analytics",
      icon: Icon(Iconsax.chart_1, color: Get.theme.colorScheme.tertiary),
      activeIcon: Icon(Iconsax.chart_15, color: Get.theme.primaryColor),
    ),
    NavigationItemModel(
      index: 2,
      title: "Transaksi",
      icon: Icon(Iconsax.money_recive, color: Get.theme.colorScheme.tertiary),
      activeIcon: Icon(Iconsax.money_recive5, color: Get.theme.primaryColor),
    ),
  ];

  int navIndex = 0;

  void onNavChanged(int index) {
    navIndex = index;
    update();
  }
}
