import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:polaris/core/data/repositories/events_repository.dart';
import 'package:polaris/core/domain/model/event.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/guest/presentation/pages/detail/fragments/detail_event_info_fragment.dart';
import 'package:polaris/guest/presentation/pages/detail/fragments/detail_event_register_fragment.dart';
import 'package:polaris/route/app_route.dart';

class DetailEventController extends GetxController {
  final EventsRepository repository = EventsRepository();
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final fragments = [
    {
      'route': AppRoutes.info,
      'title': "Info",
      'fragment': const DetailEventInfoFragment(),
    },
    {
      'route': AppRoutes.signup,
      'title': "Pendaftaran",
      'fragment': const DetailEventRegisterFragment(),
    },
  ];

  int tabIndex = 0;
  Event? event;
  SexType? sex;
  int ticketAmount = 0;
  int ticketTypeIndex = 0;

  @override
  void onInit() {
    super.onInit();

    getSingleEvent(Get.parameters['id'] as String);
  }

  Future<void> getSingleEvent(String id) async {
    event = await repository.getSingleEvent(id);
    update();
  }

  void onTabChanged(int index) {
    tabIndex = index;
    update();
  }

  void onSexChanged(SexType data) {
    sex = data;
    update();
  }

  void onAmountChanged(int amount) {
    ticketAmount = amount;
    update();
  }

  void decreaseAmount() {
    ticketAmount -= 1;
    update();
  }

  void increaseAmount() {
    ticketAmount += 1;
    update();
  }

  void onTicketTypeChanged(int index) {
    ticketTypeIndex = index;
    update();
  }
}
