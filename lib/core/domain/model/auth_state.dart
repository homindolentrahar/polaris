import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.unautheticated() = _Unauthenticated;
  const factory AuthState.admin() = _Admin;
  const factory AuthState.guest() = _Guest;
}
