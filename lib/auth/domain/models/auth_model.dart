import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel {
  final String uid;
  final String? email;
  final String? phone;
  final String? password;

  AuthModel({
    required this.uid,
    this.email,
    this.phone,
    this.password,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}
