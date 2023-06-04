import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment.g.dart';

@JsonSerializable()
class PaymentType {
  final String id;
  final String name;
  final String value;
  final String pic;

  PaymentType({
    required this.id,
    required this.name,
    required this.value,
    required this.pic,
  });

  factory PaymentType.fromJson(Map<String, dynamic> json) =>
      _$PaymentTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentTypeToJson(this);
}
