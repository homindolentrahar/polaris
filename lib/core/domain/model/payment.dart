import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment.g.dart';

@JsonSerializable()
class PaymentMethod {
  final String id;
  final String name;
  final String value;
  final String pic;

  PaymentMethod({
    required this.id,
    required this.name,
    required this.value,
    required this.pic,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentMethodToJson(this);
}
