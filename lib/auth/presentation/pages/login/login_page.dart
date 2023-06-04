import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polaris/auth/presentation/pages/login/login_controller.dart';
import 'package:polaris/auth/presentation/widgets/auth_image_banner.dart';
import 'package:polaris/core/presentation/widgets/tabs.dart';
import 'package:polaris/gen/assets.gen.dart';
import 'package:polaris/route/app_route.dart';

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
                                delegate.toNamed(
                                  "${AppRoutes.login}${controller.fragments[index]['route']}",
                                );
                              },
                            ),
                            const SizedBox(height: 32),
                            Expanded(
                              child: GetRouterOutlet(
                                anchorRoute: AppRoutes.login,
                                initialRoute:
                                    "${AppRoutes.login}${AppRoutes.email}",
                                delegate: delegate,
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
