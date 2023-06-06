import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polaris/core/presentation/widgets/buttons.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/core/presentation/widgets/tabs.dart';
import 'package:polaris/guest/presentation/pages/payment/payment_controller.dart';
import 'package:polaris/route/app_route.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
      builder: (controller) {
        return Scaffold(
          appBar: PrimaryAppBar(
            title: controller.steps[controller.stepIndex]['title'],
            onLeadingPressed: () {
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
                    onPressed: () {
                      Get.offNamedUntil(
                        AppRoutes.eTicket,
                        (route) => route.settings.name == AppRoutes.guest,
                      );
                    },
                  ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      physics: const NeverScrollableScrollPhysics(),
                      controller: controller.pageController,
                      itemCount: controller.steps.length,
                      itemBuilder: (ctx, index) =>
                          controller.steps[index]['fragment'] as Widget,
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
