import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/guest/presentation/applications/payment_page_controller.dart';

class PaymentMethodFragment extends StatelessWidget {
  const PaymentMethodFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<PaymentPageController>(),
      builder: (controller) {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: controller.payments.length,
          separatorBuilder: (ctx, index) => const SizedBox(height: 16),
          itemBuilder: (ctx, index) => PaymentTypeItem(
            isSelectable: true,
            isSelected:
                controller.selectedPayment == controller.payments[index],
            data: controller.payments[index],
            onPaymentSelected: (value) {
              controller.onPaymentChanged(value);
            },
          ),
        );
      },
    );
  }
}
