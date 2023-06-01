import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:polaris/admin/domain/models/analytics_model.dart';
import 'package:polaris/admin/presentation/fragments/admin_detail_event_analytics_fragment.dart';
import 'package:polaris/admin/presentation/fragments/admin_detail_event_info_fragment.dart';
import 'package:polaris/admin/presentation/fragments/admin_detail_event_transactions_fragment.dart';
import 'package:polaris/core/domain/model/filter_event_model.dart';
import 'package:polaris/core/domain/model/payment_type_model.dart';
import 'package:polaris/core/domain/model/ticket_type_model.dart';

class AdminDetailEventPageController extends GetxController {
  int tabIndex = 0;
  int ticketTypeIndex = 0;
  int ticketAmount = 0;
  late PageController pageController;

  AdminDetailEventPageController(int initialTabIndex) {
    pageController = PageController(initialPage: initialTabIndex);
    tabIndex = initialTabIndex;
  }

  final fragments = [
    {
      'title': "Info",
      'fragment': const AdminDetailEventInfoFragment(),
    },
    {
      'title': "Analytics",
      'fragment': const AdminDetailEventAnalyticsFragment(),
    },
    {
      'title': "Pembayaran",
      'fragment': const AdminDetailEventTransactionsFragment(),
    },
  ];
  final List<AnalyticsModel> analytics = [
    AnalyticsModel(
      title: "Jan",
      views: 58,
      clicks: 43,
      ctr: 10,
    ),
    AnalyticsModel(
      title: "Feb",
      views: 90,
      clicks: 67,
      ctr: 20,
    ),
    AnalyticsModel(
      title: "Mar",
      views: 67,
      clicks: 56,
      ctr: 80,
    ),
    AnalyticsModel(
      title: "Apr",
      views: 89,
      clicks: 75,
      ctr: 88,
    ),
    AnalyticsModel(
      title: "Mei",
      views: 45,
      clicks: 40,
      ctr: 90,
    ),
  ];
  final List<FilterEventModel> analyticsFilters = [
    FilterEventModel(
      value: 'ctr_greater_50',
      title: "CTR > 50%",
    ),
    FilterEventModel(
      value: 'sold_out',
      title: "Tiket Habis",
    ),
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
  ];
  final List<TicketTypeModel> tickets = [
    TicketTypeModel(
      id: "reguler",
      title: "Reguler",
      price: 56000,
      ticketsLeft: 19,
      benefits: [
        "Gantungan Kunci Eksklusif",
        "Kipas Tangan Eksklusif",
      ],
    ),
    TicketTypeModel(
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
    ),
    TicketTypeModel(
      id: "gold",
      title: "Gold",
      price: 120000,
      ticketsLeft: 50,
      benefits: [
        "Gantungan Kunci Eksklusif",
        "Kipas Tangan Eksklusif",
        "2 buah Softdrink",
        "5 ticket gacha",
        "Totebage Eksklusif",
      ],
    ),
  ];

  void onTabChanged(int index) {
    tabIndex = index;
    pageController.animateToPage(
      index,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 300),
    );
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
