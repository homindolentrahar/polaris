import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/admin/presentation/pages/main/main_controller.dart';
import 'package:polaris/route/app_route.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      routerDelegate: GetDelegate(),
      builder: (ctx, delegate, currentRoute) {
        return GetBuilder<MainController>(
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
                onTap: (index) {
                  controller.onNavChanged(index);
                },
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Get.theme.primaryColor,
                elevation: 0,
                child: Icon(
                  Iconsax.add,
                  color: Get.theme.colorScheme.onPrimary,
                  size: 32,
                ),
                onPressed: () {
                  Get.toNamed(
                    "${AppRoutes.admin}/${AppRoutes.events}/${AppRoutes.create}",
                  );
                },
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endDocked,
              body: SafeArea(
                child: PageView.builder(
                  controller: controller.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.navItems.length,
                  itemBuilder: (ctx, index) =>
                      controller.navItems[index].fragment,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
