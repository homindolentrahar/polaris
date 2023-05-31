import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:polaris/gen/assets.gen.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final Widget? icon;
  final EdgeInsets? padding;
  final double radius;
  final double? width;
  final double spacing;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderWidth;
  final bool isInverted;
  final VoidCallback? onPressed;

  const PrimaryButton({
    super.key,
    required this.title,
    this.titleStyle,
    this.icon,
    this.padding,
    this.radius = 8,
    this.width,
    this.spacing = 16,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth = 0,
    this.isInverted = false,
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
        borderRadius: BorderRadius.circular(radius),
        side: BorderSide(
          color: borderColor ?? Colors.transparent,
          width: borderWidth,
        ),
      ),
      padding: padding ?? const EdgeInsets.all(16),
      color: backgroundColor ?? Theme.of(context).primaryColor,
      disabledColor: Theme.of(context).colorScheme.tertiary,
      splashColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.15),
      highlightColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.25),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: isInverted
            ? [
                Text(
                  title,
                  style: titleStyle ??
                      Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                ),
                if (icon != null) ...[
                  SizedBox(width: spacing),
                  icon ?? const SizedBox.shrink(),
                ],
              ]
            : [
                if (icon != null) ...[
                  icon ?? const SizedBox.shrink(),
                  SizedBox(width: spacing),
                ],
                Text(
                  title,
                  style: titleStyle ??
                      Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                ),
              ],
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
      onPressed: onBackAction ??
          () {
            Get.back();
          },
      child: icon ??
          SvgPicture.asset(
            Assets.icons.icBack,
            width: 12,
            height: 12,
            color: isInverted
                ? Theme.of(context).colorScheme.onSurface
                : Theme.of(context).colorScheme.surface,
          ),
    );
  }
}

class PrimaryIconButton extends StatelessWidget {
  final Widget icon;
  final Color? color;
  final double radius;
  final EdgeInsets? padding;
  final Border? border;
  final VoidCallback? onPressed;

  const PrimaryIconButton({
    super.key,
    required this.icon,
    this.color,
    this.radius = 8,
    this.padding,
    this.border,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: onPressed != null
          ? color ?? Theme.of(context).colorScheme.background
          : Theme.of(context).colorScheme.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          padding: padding ?? const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: border,
          ),
          child: icon,
        ),
      ),
    );
  }
}

class PrimaryDottedButton extends StatelessWidget {
  final Widget icon;
  final String title;
  final VoidCallback onPressed;

  const PrimaryDottedButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8),
      splashColor: Get.theme.colorScheme.onSurface.withOpacity(0.025),
      highlightColor: Get.theme.colorScheme.onSurface.withOpacity(0.05),
      child: DottedBorder(
        borderType: BorderType.RRect,
        padding: const EdgeInsets.all(16),
        radius: const Radius.circular(8),
        strokeCap: StrokeCap.round,
        dashPattern: const [8, 8, 8, 8],
        color: Get.theme.colorScheme.tertiary.withOpacity(0.45),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 8),
            Text(
              title,
              style: Get.textTheme.titleSmall?.copyWith(
                color: Get.theme.colorScheme.tertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
