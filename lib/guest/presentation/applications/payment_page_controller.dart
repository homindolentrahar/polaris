import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:polaris/core/domain/model/payment_type_model.dart';
import 'package:polaris/guest/presentation/fragments/payment_confirm_fragment.dart';
import 'package:polaris/guest/presentation/fragments/payment_method_fragment.dart';

class PaymentPageController extends GetxController {
  final List<Map<String, dynamic>> steps = [
    {
      'title': "Pembayaran",
      'fragment': const PaymentMethodFragment(),
    },
    {
      'title': "Konfirmasi",
      'fragment': const PaymentConfirmFragment(),
    },
  ];
  final List<PaymentTypeModel> payments = [
    PaymentTypeModel(
      id: "gopay",
      name: "Gopay",
      value: "085711223434",
      correspondent: "Ari Lesmana",
    ),
    PaymentTypeModel(
      id: "spay",
      name: "ShopeePay",
      value: "085711223434",
      correspondent: "Broery Marantika",
    ),
    PaymentTypeModel(
      id: "bri",
      name: "Bank BRI",
      value: "1102231324",
      correspondent: "Fazal Dath",
    ),
  ];
  final PageController pageController = PageController();

  int stepIndex = 0;
  PaymentTypeModel? selectedPayment;

  void onTabChanged(int index) {
    stepIndex = index;
    pageController.animateToPage(
      index,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 300),
    );
    update();
  }

  void onPaymentChanged(PaymentTypeModel data) {
    selectedPayment = data;
    update();
  }
}
