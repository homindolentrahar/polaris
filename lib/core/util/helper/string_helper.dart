import 'package:intl/intl.dart';

abstract class StringHelper {
  static String formatTimer(int tick) {
    final minutes = tick ~/ 60;
    final seconds = tick % 60;

    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  static String formatCurrency(int amount) {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: "Rp ",
      decimalDigits: 0,
    ).format(amount);
  }

  static String formatDate(DateTime dateTime) {
    return DateFormat("dd MMM yyyy").format(dateTime);
  }

  static String formatTime(DateTime dateTime) {
    return "${DateFormat("HH:mm").format(dateTime)} WIB";
  }

  static String obscurePhone(String phone) {
    return phone.replaceRange(3, 9, "*******");
  }
}
