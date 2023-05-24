abstract class StringHelper {
  static String formatTimer(int tick) {
    final minutes = tick ~/ 60;
    final seconds = tick % 60;

    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  static String obscurePhone(String phone) {
    return phone.replaceRange(3, 9, "*******");
  }
}
