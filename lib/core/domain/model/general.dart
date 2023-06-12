import 'package:freezed_annotation/freezed_annotation.dart';

part 'general.g.dart';

@JsonSerializable()
class FilterSortData {
  final String id;
  final String value;
  final String title;

  FilterSortData({
    required this.id,
    required this.value,
    required this.title,
  });

  factory FilterSortData.fromJson(Map<String, dynamic> json) =>
      _$FilterSortDataFromJson(json);

  Map<String, dynamic> toJson() => _$FilterSortDataToJson(this);
}
