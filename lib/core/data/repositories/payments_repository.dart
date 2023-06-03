import 'package:polaris/core/domain/model/payment.dart';
import 'package:polaris/core/util/helper/json_helper.dart';

class PaymentsRepository {
  Future<List<PaymentType>> getAllPaymentTypes() async {
    final List<dynamic> data = await JsonHelper.readJson("payments");

    return data.map((e) => PaymentType.fromJson(e)).toList();
  }

  Future<PaymentType> getSinglePaymentType(String id) async {
    final List<dynamic> data = await JsonHelper.readJson("payments");
    final List<PaymentType> events =
        data.map((e) => PaymentType.fromJson(e)).toList();

    return events.firstWhere((element) => element.id == id);
  }
}
