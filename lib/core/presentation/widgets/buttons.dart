import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:polaris/gen/assets.gen.dart';
import 'package:polaris/gen/colors.gen.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final double? width;
  final Color? backgroundColor;
  final Color? titleColor;
  final VoidCallback? onPressed;

  const PrimaryButton({
    super.key,
    required this.title,
    this.width,
    this.backgroundColor,
    this.titleColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width ?? double.infinity,
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      color: onPressed != null
          ? backgroundColor ?? Theme.of(context).primaryColor
          : ColorName.gray,
      splashColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.15),
      highlightColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.25),
      onPressed: onPressed,
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: titleColor ?? Theme.of(context).colorScheme.onPrimary,
            ),
      ),
    );
  }
}

class PrimaryTextButton extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final VoidCallback onPressed;

  const PrimaryTextButton({
    super.key,
    required this.title,
    this.titleColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      hoverColor: Theme.of(context).primaryColor.withOpacity(0.10),
      highlightColor: Theme.of(context).primaryColor.withOpacity(0.20),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}

class PrimaryBackButton extends StatelessWidget {
  final Widget? icon;
  final bool isInverted;
  final VoidCallback? onBackAction;

  const PrimaryBackButton({
    super.key,
    this.icon,
    this.isInverted = false,
    this.onBackAction,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 0,
      elevation: 0,
      highlightElevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      padding: const EdgeInsets.all(12),
      color: isInverted
          ? Theme.of(context).colorScheme.surface
          : Theme.of(context).colorScheme.onSurface,
      splashColor: Theme.of(context).colorScheme.surface.withOpacity(0.10),
      highlightColor: Theme.of(context).colorScheme.surface.withOpacity(0.20),
      child:
          icon ?? SvgPicture.asset(Assets.icons.icBack, width: 16, height: 16),
      onPressed: () {
        Get.back();
      },
    );
  }
}
