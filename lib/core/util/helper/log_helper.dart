import 'package:logger/logger.dart';

class LogHelper {
  late Logger _logger;

  static LogHelper instance = LogHelper._();

  LogHelper._() {
    _logger = Logger();
  }

  void debug(String message) {
    _logger.d(message);
  }

  void error(String message) {
    _logger.e(message);
  }

  void warning(String message) {
    _logger.w(message);
  }

  void info(String message) {
    _logger.i(message);
  }
}
