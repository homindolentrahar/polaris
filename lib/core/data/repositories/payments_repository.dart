import 'package:polaris/core/domain/model/payment.dart';
import 'package:polaris/core/util/helper/json_helper.dart';

class PaymentsRepository {
  Future<List<PaymentMethod>> getAllPaymentMethods() async {
    final List<dynamic> data = await JsonHelper.readJson("payments");

    return data.map((e) => PaymentMethod.fromJson(e)).toList();
  }

  Future<PaymentMethod> getSinglePaymentMethod(String id) async {
    final List<dynamic> data = await JsonHelper.readJson("payments");
    final List<PaymentMethod> events =
        data.map((e) => PaymentMethod.fromJson(e)).toList();

    return events.firstWhere((element) => element.id == id);
  }
}
