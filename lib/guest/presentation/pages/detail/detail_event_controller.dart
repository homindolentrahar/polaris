import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:polaris/core/data/repositories/events_repository.dart';
import 'package:polaris/core/domain/model/event.dart';
import 'package:polaris/core/domain/share.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/gen/assets.gen.dart';
import 'package:polaris/guest/presentation/pages/detail/fragments/detail_event_info_fragment.dart';
import 'package:polaris/guest/presentation/pages/detail/fragments/detail_event_register_fragment.dart';
import 'package:polaris/route/app_route.dart';

class DetailEventController extends GetxController {
  final EventsRepository repository = EventsRepository();
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final PageController pageController = PageController();
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
  final List<Share> shareItems = [
    Share(
      id: "2",
      icon: Image.asset(
        Assets.icons.icWhatsapp.path,
        width: 20,
        height: 20,
      ),
      title: "Chat/Group Chat",
    ),
    Share(
      id: "3",
      icon: Image.asset(
        Assets.icons.icInstagram.path,
        width: 20,
        height: 20,
      ),
      title: "Instagram Story",
    ),
    Share(
      id: "4",
      icon: Image.asset(
        Assets.icons.icInstagram.path,
        width: 20,
        height: 20,
      ),
      title: "Instagram Post",
    ),
    Share(
      id: "5",
      icon: Image.asset(
        Assets.icons.icFacebook.path,
        width: 20,
        height: 20,
      ),
      title: "Facebook Post",
    ),
    Share(
      id: "6",
      icon: Image.asset(
        Assets.icons.icFacebook.path,
        width: 20,
        height: 20,
      ),
      title: "Facebook Story",
    ),
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
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
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
