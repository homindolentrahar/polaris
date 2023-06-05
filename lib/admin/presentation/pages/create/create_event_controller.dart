import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:polaris/admin/presentation/pages/create/fragments/create_event_info_fragment.dart';
import 'package:polaris/admin/presentation/pages/create/fragments/create_event_method_fragment.dart';
import 'package:polaris/admin/presentation/pages/create/fragments/create_event_ticket_fragment.dart';
import 'package:polaris/core/data/repositories/events_repository.dart';
import 'package:polaris/core/data/repositories/payments_repository.dart';
import 'package:polaris/core/domain/model/event.dart';
import 'package:polaris/core/domain/model/payment.dart';

class CreateEventController extends GetxController {
  final EventsRepository eventsRepository = EventsRepository();
  final PaymentsRepository paymentsRepository = PaymentsRepository();
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
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final PageController pageController = PageController();

  int stepIndex = 0;
  Event? event;
  List<PaymentMethod> payments = List.empty();

  @override
  void onInit() {
    super.onInit();

    getSingleEvent("1");
    getPayments();
  }

  Future<void> getSingleEvent(String id) async {
    event = await eventsRepository.getSingleEvent(id);
    update();
  }

  Future<void> getPayments() async {
    payments = await paymentsRepository.getAllPaymentMethods();
    update();
  }

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
