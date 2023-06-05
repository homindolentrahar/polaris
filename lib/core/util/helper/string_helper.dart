import 'package:intl/intl.dart';

abstract class StringHelper {
  static String formatTimer(int tick) {
    final minutes = tick ~/ 60;
    final seconds = tick % 60;

    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: "Rp ",
      decimalDigits: 0,
    ).format(amount);
  }

  static String formatCompactCurrency(double amount) {
    return NumberFormat.compactCurrency(
      locale: 'id_ID',
      symbol: "Rp ",
      decimalDigits: 0,
    ).format(amount);
  }

  static String formatDate({
    required DateTime dateTime,
    String pattern = "dd MMM yyyy",
  }) {
    return DateFormat("dd MMM yyyy").format(dateTime);
  }

  static String formatTime({
    required DateTime dateTime,
    String pattern = "HH:mm",
  }) {
    return DateFormat("HH:mm").format(dateTime);
  }

  static String formatMonth(DateTime dateTime) {
    return DateFormat("MMM").format(dateTime);
  }

  static String obscurePhone(String phone) {
    return phone.replaceRange(3, 9, "*******");
  }
}
