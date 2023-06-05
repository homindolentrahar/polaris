import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/guest/presentation/pages/payment/payment_controller.dart';

class PaymentMethodFragment extends StatelessWidget {
  const PaymentMethodFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
      builder: (controller) {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: controller.types.length,
          separatorBuilder: (ctx, index) => const SizedBox(height: 16),
          itemBuilder: (ctx, index) => PaymentMethodItem(
            isSelectable: true,
            isSelected: controller.selectedPayment == controller.types[index],
            data: controller.types[index],
            onPaymentSelected: (value) {
              controller.onPaymentChanged(value);
            },
          ),
        );
      },
    );
  }
}
