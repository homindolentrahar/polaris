import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polaris/core/data/repositories/payments_repository.dart';
import 'package:polaris/core/domain/model/payment.dart';
import 'package:polaris/guest/presentation/pages/payment/fragments/payment_confirm_fragment.dart';
import 'package:polaris/guest/presentation/pages/payment/fragments/payment_method_fragment.dart';
import 'package:polaris/route/app_route.dart';

class PaymentController extends GetxController {
  final PaymentsRepository repository = PaymentsRepository();
  final PageController pageController = PageController();
  final List<Map<String, dynamic>> steps = [
    {
      'route': AppRoutes.method,
      'title': "Pembayaran",
      'fragment': const PaymentMethodFragment(),
    },
    {
      'route': AppRoutes.confirm,
      'title': "Konfirmasi",
      'fragment': const PaymentConfirmFragment(),
    },
  ];

  List<PaymentMethod> types = List.empty();
  int stepIndex = 0;
  PaymentMethod? selectedPayment;

  @override
  void onInit() {
    super.onInit();

    getAllPaymentTypes();
  }

  Future<void> getAllPaymentTypes() async {
    types = await repository.getAllPaymentMethods();
    update();
  }

  void onTabChanged(int index) {
    stepIndex = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    update();
  }

  void onPaymentChanged(PaymentMethod data) {
    selectedPayment = data;
    update();
  }
}
