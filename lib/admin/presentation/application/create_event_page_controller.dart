import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:polaris/admin/presentation/fragments/create_event_info_fragment.dart';
import 'package:polaris/admin/presentation/fragments/create_event_method_fragment.dart';
import 'package:polaris/admin/presentation/fragments/create_event_ticket_fragment.dart';
import 'package:polaris/core/domain/model/payment_type_model.dart';
import 'package:polaris/core/domain/model/ticket_type_model.dart';

class CreateEventPageController extends GetxController {
  final List<Map<String, dynamic>> steps = [
    {
      'title': "Info",
      'fragment': const CreateEventInfoFragment(),
      'action': "Selanjutnya",
    },
    {
      'title': "Tiket",
      'fragment': const CreateEventTicketFragment(),
      'action': "Selanjutnya",
    },
    {
      'title': "Metode",
      'fragment': const CreateEventMethodFragment(),
      'action': "Simpan",
    },
  ];
  final TicketTypeModel ticketType = TicketTypeModel(
    id: "silver",
    title: "Silver",
    price: 80000,
    ticketsLeft: 89,
    benefits: [
      "Gantungan Kunci Eksklusif",
      "Kipas Tangan Eksklusif",
      "1 buah Softdrink",
      "1 ticket gacha",
    ],
  );
  final PaymentTypeModel paymentMethod = PaymentTypeModel(
    id: "gopay",
    name: "Gopay",
    value: "085711223434",
    correspondent: "Ari Lesmana",
  );
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final PageController pageController = PageController();

  int stepIndex = 0;

  void onStepChanged(int index) {
    stepIndex = index;
    pageController.animateToPage(
      index,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 300),
    );
    update();
  }
}
