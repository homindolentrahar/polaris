import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polaris/core/presentation/widgets/buttons.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/core/presentation/widgets/tabs.dart';
import 'package:polaris/guest/presentation/applications/payment_page_controller.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.put(PaymentPageController()),
        builder: (controller) {
          return Scaffold(
            appBar: PrimaryAppBar(
              title: controller.steps[controller.stepIndex]['title'],
              onBackPressed: () {
                if (controller.stepIndex >= 1) {
                  controller.onTabChanged(controller.stepIndex - 1);
                } else {
                  Get.back();
                }
              },
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(16),
              child: controller.stepIndex == 0
                  ? PrimaryButton(
                      title: "Bayar",
                      onPressed: controller.selectedPayment == null
                          ? null
                          : () {
                              controller.onTabChanged(controller.stepIndex + 1);
                            },
                    )
                  : PrimaryButton(
                      title: "Konfirmasi",
                      onPressed: () {},
                    ),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 24,
                  right: 24,
                  bottom: 32,
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
        });
  }
}
