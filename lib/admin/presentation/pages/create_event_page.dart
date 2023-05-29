import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polaris/admin/presentation/application/create_event_page_controller.dart';
import 'package:polaris/core/presentation/widgets/buttons.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/core/presentation/widgets/tabs.dart';
import 'package:polaris/route/app_route.dart';

class CreateEventPage extends StatelessWidget {
  const CreateEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.put(CreateEventPageController()),
      builder: (controller) {
        return Scaffold(
          appBar: PrimaryAppBar(
              title: controller.steps[controller.stepIndex]['title'],
              onLeadingPressed: () {
                if (controller.stepIndex >= 1) {
                  controller.onStepChanged(controller.stepIndex - 1);
                } else {
                  Get.back();
                }
              }),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16),
            child: PrimaryButton(
              title: controller.steps[controller.stepIndex]['action'],
              onPressed: () {
                if (controller.stepIndex == controller.steps.length - 1) {
                  Get.until((route) => route.settings.name == AppRoutes.admin);
                  return;
                }

                controller.onStepChanged(controller.stepIndex + 1);
              },
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                bottom: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryStepBar(
                    currentIndex: controller.stepIndex,
                    titles: controller.steps
                        .map((e) => e['title'] as String)
                        .toList(),
                    onTabChanged: (index) {},
                  ),
                  const SizedBox(height: 32),
                  Expanded(
                    child: PageView.builder(
                      controller: controller.pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.steps.length,
                      itemBuilder: (ctx, index) {
                        return controller.steps[index]['fragment'];
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
