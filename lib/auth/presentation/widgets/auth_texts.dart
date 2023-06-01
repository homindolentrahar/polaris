import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthTitleText extends StatelessWidget {
  final String text;
  final Color? textColor;

  const AuthTitleText({
    super.key,
    required this.text,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Get.textTheme.headlineLarge?.copyWith(
        color: textColor ?? Get.theme.colorScheme.onSurface,
      ),
    );
  }
}

class AuthSubtitleText extends StatelessWidget {
  final String text;
  final Color? textColor;

  const AuthSubtitleText({super.key, required this.text, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Get.textTheme.titleMedium?.copyWith(
        color: textColor ?? Theme.of(context).colorScheme.tertiary,
      ),
    );
  }
}

class AuthFooterText extends StatelessWidget {
  final String text;
  final String actionText;
  final bool isTimerActive;
  final VoidCallback onActionPressed;

  const AuthFooterText({
    super.key,
    required this.text,
    required this.actionText,
    this.isTimerActive = false,
    required this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Get.textTheme.titleMedium
            ?.copyWith(color: Theme.of(context).colorScheme.tertiary),
        children: [
          TextSpan(text: text),
          TextSpan(
            text: actionText,
            recognizer: TapGestureRecognizer()
              ..onTap = isTimerActive ? null : onActionPressed,
            style: isTimerActive
                ? Get.textTheme.headlineSmall
                    ?.copyWith(color: Theme.of(context).colorScheme.onSurface)
                : Get.textTheme.headlineSmall
                    ?.copyWith(color: Theme.of(context).primaryColor),
          ),
        ],
      ),
    );
  }
}
