import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polaris/auth/presentation/pages/login/login_controller.dart';
import 'package:polaris/auth/presentation/widgets/auth_image_banner.dart';
import 'package:polaris/core/presentation/widgets/tabs.dart';
import 'package:polaris/gen/assets.gen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      routerDelegate: GetDelegate(),
      builder: (ctx, delegate, currentRoute) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                AuthImageBanner(
                  asset: Assets.images.login,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: GetBuilder<LoginController>(
                      builder: (controller) {
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            PrimaryTabBar(
                              currentIndex: controller.tabIndex,
                              titles: controller.fragments
                                  .map((e) => e['title'] as String)
                                  .toList(),
                              onTabChanged: (index) {
                                controller.onTabChanged(index);
                              },
                            ),
                            const SizedBox(height: 32),
                            Expanded(
                              child: PageView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                controller: controller.pageController,
                                itemCount: controller.fragments.length,
                                itemBuilder: (ctx, index) => controller
                                    .fragments[index]['fragment'] as Widget,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
