import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/admin/presentation/application/admin_home_page_controller.dart';
import 'package:polaris/admin/presentation/fragments/analytics_fragment.dart';
import 'package:polaris/admin/presentation/fragments/beranda_fragment.dart';
import 'package:polaris/admin/presentation/fragments/transactions_fragment.dart';
import 'package:polaris/core/presentation/application/app_controller.dart';
import 'package:polaris/route/app_route.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AdminHomePageController(),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            activeIndex: controller.navIndex,
            height: 72,
            backgroundColor: Get.theme.colorScheme.surface,
            elevation: 0,
            shadow: Shadow(
              color: Get.theme.colorScheme.onSurface.withOpacity(0.15),
              blurRadius: 20,
            ),
            hideAnimationCurve: Curves.easeInOut,
            itemCount: controller.navItems.length,
            tabBuilder: (index, selected) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  selected
                      ? controller.navItems[index].activeIcon
                      : controller.navItems[index].icon,
                  Visibility(
                    visible: selected,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          controller.navItems[index].title,
                          style: Get.textTheme.headlineSmall
                              ?.copyWith(color: Get.theme.primaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            onTap: controller.onNavChanged,
          ),
          floatingActionButton: FloatingActionButton(
            elevation: 0,
            child: Icon(
              Iconsax.add,
              color: Get.theme.colorScheme.onPrimary,
              size: 32,
            ),
            onPressed: () {
              // Get.toNamed(AppRoutes.adminCreate);
              Get.find<AppController>().removeAppMode();

              Get.offAllNamed(AppRoutes.landing);
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          body: SafeArea(
            child: IndexedStack(
              index: controller.navIndex,
              children: const [
                BerandaFragment(),
                AnalyticsFragment(),
                TransactionsFragment(),
              ],
            ),
          ),
        );
      },
    );
  }
}
