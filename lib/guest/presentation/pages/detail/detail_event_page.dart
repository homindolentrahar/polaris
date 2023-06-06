import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/core/presentation/widgets/buttons.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/core/presentation/widgets/tabs.dart';
import 'package:polaris/guest/presentation/pages/detail/detail_event_controller.dart';
import 'package:polaris/route/app_route.dart';

class DetailEventPage extends StatelessWidget {
  const DetailEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailEventController>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: controller.tabIndex == 0
                ? PrimaryButton(
                    title: "Bagikan",
                    icon: Icon(
                      Iconsax.link_2,
                      color: Get.theme.colorScheme.onPrimary,
                      size: 16,
                    ),
                    onPressed: () {},
                  )
                : PrimaryButton(
                    title: "Daftar",
                    onPressed: () {
                      Get.toNamed(
                        "${AppRoutes.guest}/${AppRoutes.payment}/${Get.parameters['id']}",
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
                              Get.theme.colorScheme.onSurface.withOpacity(0.35),
                              Get.theme.colorScheme.onSurface,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ).createShader(bounds),
                          blendMode: BlendMode.srcATop,
                          child: controller.event?.imageUrl != null
                              ? CachedNetworkImage(
                                  imageUrl: controller.event?.imageUrl ?? "",
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                )
                              : Container(
                                  color: Get.theme.colorScheme.onSurface,
                                ),
                        ),
                      ),
                      Positioned(
                        left: 16,
                        right: 16,
                        bottom: -48,
                        child: DetailEventBanner(
                          title: controller.event?.title ?? "",
                          dateTime:
                              controller.event?.dateTime ?? DateTime.now(),
                          ticketTypes: controller.event?.tickets.length ?? 0,
                        ),
                      ),
                      const Positioned(
                        left: 24,
                        top: 16,
                        child: PrimaryBackButton(
                          isInverted: true,
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
                            itemBuilder: (ctx, index) => controller
                                .fragments[index]['fragment'] as Widget,
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
