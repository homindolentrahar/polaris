import 'package:get/get.dart';
import 'package:polaris/core/data/repositories/transactions_repository.dart';
import 'package:polaris/core/domain/model/filter_event_model.dart';
import 'package:polaris/core/domain/model/transaction.dart';

class TransactionsController extends GetxController {
  final TransactionsRepository repository = TransactionsRepository();
  final List<FilterEventModel> filters = [
    FilterEventModel(
      value: 'ctr_greater_50',
      title: "CTR > 50%",
    ),
    FilterEventModel(
      value: 'sold_out',
      title: "Tiket Habis",
    ),
  ];

  List<Transaction> transactions = List.empty();

  @override
  void onInit() {
    super.onInit();

    getAllTransactions();
  }

  Future<void> getAllTransactions() async {
    transactions = await repository.getAllTransactions();
    update();
  }
}
