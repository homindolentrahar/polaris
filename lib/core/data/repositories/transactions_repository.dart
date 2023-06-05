import 'package:polaris/core/domain/model/transaction.dart';
import 'package:polaris/core/util/helper/json_helper.dart';

class TransactionsRepository {
  Future<List<Transaction>> getAllTransactions() async {
    final List<dynamic> data = await JsonHelper.readJson("transactions");

    return data.map((e) => Transaction.fromJson(e)).toList();
  }
}
