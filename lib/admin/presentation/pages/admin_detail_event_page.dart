import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/admin/presentation/application/admin_detail_event_page_controller.dart';
import 'package:polaris/core/presentation/widgets/buttons.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/core/presentation/widgets/tabs.dart';
import 'package:polaris/route/app_route.dart';

class AdminDetailEventPage extends StatelessWidget {
  const AdminDetailEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.put(
        AdminDetailEventPageController(Get.arguments as int),
      ),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            child: PrimaryButton(
              icon: Icon(
                Iconsax.link_2,
                color: Get.theme.colorScheme.surface,
                size: 16,
              ),
              title: "Generate URL",
              onPressed: () {
                Get.toNamed(
                  "${AppRoutes.payment}/${Get.parameters['id']}",
                );
              },
            ),
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 280,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Hero(
                        tag: Get.parameters['id'] as String,
                        child: ShaderMask(
                          shaderCallback: (bounds) => LinearGradient(
                            colors: [
                              Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.35),
                              Theme.of(context).colorScheme.onSurface,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ).createShader(bounds),
                          blendMode: BlendMode.srcATop,
                          child: Image.network(
                            "https://images.unsplash.com/photo-1684779847639-fbcc5a57dfe9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80",
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 16,
                        right: 16,
                        bottom: -48,
                        child: DetailEventBanner(
                          title: "Matsuri UII 203",
                          dateTime: DateTime.now(),
                          ticketTypes: 5,
                        ),
                      ),
                      Positioned(
                        left: 24,
                        right: 24,
                        top: 16,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const PrimaryBackButton(isInverted: true),
                            PrimaryButton(
                              width: 0,
                              padding: const EdgeInsets.all(12),
                              icon: Icon(
                                Iconsax.magicpen5,
                                color: Get.theme.colorScheme.onSurface,
                                size: 16,
                              ),
                              title: "Ubah Data",
                              titleStyle: Get.textTheme.headlineSmall?.copyWith(
                                color: Get.theme.colorScheme.onSurface,
                              ),
                              spacing: 8,
                              backgroundColor: Get.theme.colorScheme.surface,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 64),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: Column(
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
                        const SizedBox(height: 16),
                        Expanded(
                          child: PageView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: controller.pageController,
                            itemCount: controller.fragments.length,
                            itemBuilder: (ctx, index) {
                              return controller.fragments[index]['fragment']
                                  as Widget;
                            },
                          ),
                        ),
                      ],
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
