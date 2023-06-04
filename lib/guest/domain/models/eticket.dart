import 'package:freezed_annotation/freezed_annotation.dart';

part 'eticket.g.dart';

@JsonSerializable()
class Eticket {
  @JsonKey(name: "unique_code")
  final String uniqueCode;
  @JsonKey(name: "order_id")
  final String orderId;
  final String type;
  final String title;
  final double price;
  @JsonKey(name: "date_time")
  final DateTime dateTime;
  final String venue;
  final String seat;
  @JsonKey(name: "image_url")
  final String imageUrl;

  Eticket({
    required this.uniqueCode,
    required this.orderId,
    required this.type,
    required this.title,
    required this.price,
    required this.dateTime,
    required this.venue,
    required this.seat,
    required this.imageUrl,
  });

  factory Eticket.fromJson(Map<String, dynamic> json) =>
      _$EticketFromJson(json);

  Map<String, dynamic> toJson() => _$EticketToJson(this);
}
