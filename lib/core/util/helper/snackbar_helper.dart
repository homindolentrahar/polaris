import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class SnackbarHelper {
  static showSnackbar({
    required String title,
    required String message,
    Color? color,
    SnackPosition? position,
    Widget? icon,
    Duration? duration,
  }) {
    if (Get.isSnackbarOpen) {
      Get.closeAllSnackbars();
    }

    Get.snackbar(
      title,
      message,
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      forwardAnimationCurve: Curves.easeInOut,
      reverseAnimationCurve: Curves.easeInOut,
      duration: duration ?? const Duration(milliseconds: 2500),
      backgroundColor: color ?? Get.theme.colorScheme.onSurface,
      snackStyle: SnackStyle.GROUNDED,
      snackPosition: position ?? SnackPosition.BOTTOM,
      icon: icon,
      titleText: Text(
        title,
        style: Get.textTheme.headlineSmall?.copyWith(
          color: Get.theme.colorScheme.surface,
        ),
      ),
      messageText: Text(
        message,
        style: Get.theme.textTheme.bodySmall?.copyWith(
          color: Get.theme.colorScheme.background,
        ),
      ),
    );
  }
}
