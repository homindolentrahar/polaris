import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/core/domain/model/navigation_item_model.dart';
import 'package:polaris/route/app_route.dart';

class MainController extends GetxController {
  final List<NavigationItemModel> navItems = [
    NavigationItemModel(
      route: AppRoutes.home,
      index: 0,
      title: "Beranda",
      icon: Icon(Iconsax.home_1, color: Get.theme.colorScheme.tertiary),
      activeIcon: Icon(Iconsax.home_15, color: Get.theme.primaryColor),
    ),
    NavigationItemModel(
      route: AppRoutes.analytics,
      index: 1,
      title: "Analitik",
      icon: Icon(Iconsax.chart_1, color: Get.theme.colorScheme.tertiary),
      activeIcon: Icon(Iconsax.chart_15, color: Get.theme.primaryColor),
    ),
    NavigationItemModel(
      route: AppRoutes.transactions,
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
