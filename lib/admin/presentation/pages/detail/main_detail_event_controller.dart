import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:polaris/admin/presentation/pages/detail/fragments/main_detail_event_analytics_fragment.dart';
import 'package:polaris/admin/presentation/pages/detail/fragments/main_detail_event_info_fragment.dart';
import 'package:polaris/admin/presentation/pages/detail/fragments/main_detail_event_transactions_fragment.dart';
import 'package:polaris/core/data/repositories/analytics_repository.dart';
import 'package:polaris/core/data/repositories/events_repository.dart';
import 'package:polaris/core/data/repositories/filters_repository.dart';
import 'package:polaris/core/data/repositories/payments_repository.dart';
import 'package:polaris/core/data/repositories/transactions_repository.dart';
import 'package:polaris/core/domain/model/analytic.dart';
import 'package:polaris/core/domain/model/event.dart';
import 'package:polaris/core/domain/model/general.dart';
import 'package:polaris/core/domain/model/payment.dart';
import 'package:polaris/core/domain/model/transaction.dart';
import 'package:polaris/core/domain/share.dart';
import 'package:polaris/gen/assets.gen.dart';

class MainDetailEventController extends GetxController {
  final EventsRepository eventsRepository = EventsRepository();
  final PaymentsRepository paymentsRepository = PaymentsRepository();
  final AnalyticsRepository analyticsRepository = AnalyticsRepository();
  final TransactionsRepository transactionsRepository =
      TransactionsRepository();
  final FiltersRepository filtersRepository = FiltersRepository();
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

  Event? event;
  List<Event> events = List.empty();
  List<PaymentMethod> payments = List.empty();
  List<Analytic> analytics = List.empty();
  Map<DateTime, List<Analytic>> totalAnalytics = {};
  List<Analytic> monthlyAnalytics = List.empty();
  List<Transaction> transactions = List.empty();
  List<FilterSortData> filters = List.empty();
  List<FilterSortData> sorts = List.empty();
  FilterSortData? selectedFilter;
  FilterSortData? selectedSort;
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
    filters = await filtersRepository.getFilters(tabIndex == 1
        ? "analytics"
        : tabIndex == 2
            ? "transactions"
            : "events");
    sorts = await filtersRepository.getSorts(tabIndex == 1
        ? "analytics"
        : tabIndex == 2
            ? "transactions"
            : "events");
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

  void onTabChanged(int index) async {
    tabIndex = index;
    pageController.animateToPage(
      index,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 300),
    );
    filters = await filtersRepository.getFilters(tabIndex == 1
        ? "analytics"
        : tabIndex == 2
            ? "transactions"
            : "events");
    sorts = await filtersRepository.getSorts(tabIndex == 1
        ? "analytics"
        : tabIndex == 2
            ? "transactions"
            : "events");
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

  void onFilterSelected(FilterSortData filter) {
    if (selectedFilter?.id == filter.id) {
      selectedFilter = null;
    } else {
      selectedFilter = filter;
    }
    update();
  }

  void onSortSelected(FilterSortData filter) {
    selectedSort = filter;
    update();
  }

  void clearSelectedSort() {
    selectedSort = null;
    update();
  }
}
