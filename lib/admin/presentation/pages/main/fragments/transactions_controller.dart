import 'package:get/get.dart';
import 'package:polaris/core/data/repositories/transactions_repository.dart';
import 'package:polaris/core/domain/model/transaction.dart';

class TransactionsController extends GetxController {
  final TransactionsRepository repository = TransactionsRepository();

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
