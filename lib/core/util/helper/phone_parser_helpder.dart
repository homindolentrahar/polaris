abstract class PhoneParserHelper {
  static String getPhoneNumber(String phoneNumber) {
    if (RegExp(r"^\+62[0-9]+").hasMatch(phoneNumber)) {
      return phoneNumber;
    } else if (RegExp(r"^62[0-9]+").hasMatch(phoneNumber)) {
      return "+$phoneNumber";
    } else if (RegExp(r"^0[0-9]+").hasMatch(phoneNumber)) {
      return "+62${phoneNumber.substring(1)}";
    } else if (RegExp(r"^[0-9]+").hasMatch(phoneNumber)) {
      return "+62$phoneNumber";
    } else {
      throw Exception("Phone number format invalid");
    }
  }
}
