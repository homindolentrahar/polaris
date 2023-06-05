import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytic.g.dart';

@JsonSerializable()
class Analytic {
  final String id;
  @JsonKey(name: "event_id")
  final String eventId;
  @JsonKey(name: "event_name")
  final String eventName;
  final DateTime period;
  final int views;
  final int clicks;
  final double ctr;

  Analytic({
    required this.id,
    required this.eventId,
    required this.eventName,
    required this.period,
    required this.views,
    required this.clicks,
    required this.ctr,
  });

  factory Analytic.fromJson(Map<String, dynamic> json) =>
      _$AnalyticFromJson(json);

  Map<String, dynamic> toJson() => _$AnalyticToJson(this);
}
