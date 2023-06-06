import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:polaris/admin/presentation/pages/detail/fragments/main_detail_event_analytics_fragment.dart';
import 'package:polaris/admin/presentation/pages/detail/fragments/main_detail_event_info_fragment.dart';
import 'package:polaris/admin/presentation/pages/detail/fragments/main_detail_event_transactions_fragment.dart';
import 'package:polaris/core/data/repositories/analytics_repository.dart';
import 'package:polaris/core/data/repositories/events_repository.dart';
import 'package:polaris/core/data/repositories/payments_repository.dart';
import 'package:polaris/core/data/repositories/transactions_repository.dart';
import 'package:polaris/core/domain/model/analytic.dart';
import 'package:polaris/core/domain/model/event.dart';
import 'package:polaris/core/domain/model/payment.dart';
import 'package:polaris/core/domain/model/transaction.dart';

class MainDetailEventController extends GetxController {
  final EventsRepository eventsRepository = EventsRepository();
  final PaymentsRepository paymentsRepository = PaymentsRepository();
  final AnalyticsRepository analyticsRepository = AnalyticsRepository();
  final TransactionsRepository transactionsRepository =
      TransactionsRepository();
  final fragments = [
    {
      'title': "Info",
      'fragment': const MainDetailEventInfoFragment(),
    },
    {
      'title': "Analitik",
      'fragment': const MainDetailEventAnalyticsFragment(),
    },
    {
      'title': "Transaksi",
      'fragment': const MainDetailEventTransactionsFragment(),
    },
  ];
  // final List<FilterEventModel> analyticsFilters = [
  //   FilterEventModel(
  //     value: 'ctr_greater_50',
  //     title: "CTR > 50%",
  //   ),
  //   FilterEventModel(
  //     value: 'sold_out',
  //     title: "Tiket Habis",
  //   ),
  // ];

  Event? event;
  List<Event> events = List.empty();
  List<PaymentMethod> payments = List.empty();
  List<Analytic> analytics = List.empty();
  Map<DateTime, List<Analytic>> totalAnalytics = {};
  List<Analytic> monthlyAnalytics = List.empty();
  List<Transaction> transactions = List.empty();
  int tabIndex = 0;
  int ticketTypeIndex = 0;
  int ticketAmount = 0;

  late PageController pageController;

  @override
  void onInit() {
    super.onInit();

    final initialTabIndex = Get.arguments as int;
    pageController = PageController(initialPage: initialTabIndex);
    tabIndex = initialTabIndex;

    getAllEvents();
    getSingleEvent(Get.parameters['id'] as String);
    getPayments();
    getAnalytics();
    getTransactions();
  }

  Future<void> getAllEvents() async {
    events = await eventsRepository.getAllEvents();
    update();
  }

  Future<void> getSingleEvent(String id) async {
    event = await eventsRepository.getSingleEvent(id);
    update();
  }

  Future<void> getPayments() async {
    payments = await paymentsRepository.getAllPaymentMethods();
    update();
  }

  Future<void> getAnalytics() async {
    totalAnalytics = groupBy(
      await analyticsRepository.getAllAnalytics(),
      (e) => DateTime(DateTime.now().year, e.period.month),
    );
    monthlyAnalytics = (await analyticsRepository.getAllAnalytics())
        .where(
          (element) => element.period.month == DateTime.now().month,
        )
        .toList();
    update();
  }

  Future<void> getTransactions() async {
    transactions = await transactionsRepository.getAllTransactions();
    update();
  }

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
