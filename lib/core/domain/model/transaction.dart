import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
  final String id;
  @JsonKey(name: "invoice_code")
  final String invoiceCode;
  @JsonKey(name: "date_time")
  final DateTime dateTime;
  @JsonKey(name: "payment_id")
  final String paymentId;
  @JsonKey(name: "payment_name")
  final String paymentName;
  final double price;
  @JsonKey(name: "event_id")
  final String eventId;
  @JsonKey(name: "event_name")
  final String eventName;
  @JsonKey(name: "user_id")
  final String userId;
  @JsonKey(name: "user")
  final String user;
  final bool paid;

  Transaction({
    required this.id,
    required this.invoiceCode,
    required this.dateTime,
    required this.paymentId,
    required this.paymentName,
    required this.price,
    required this.eventId,
    required this.eventName,
    required this.userId,
    required this.user,
    required this.paid,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
