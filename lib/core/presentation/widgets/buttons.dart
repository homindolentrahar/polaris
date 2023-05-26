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
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  const PrimaryButton({
    super.key,
    required this.title,
    this.titleStyle,
    this.icon,
    this.padding,
    this.radius = 8,
    this.width,
    this.backgroundColor,
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
      ),
      padding: padding ?? const EdgeInsets.all(16),
      color: backgroundColor ?? Theme.of(context).primaryColor,
      disabledColor: Theme.of(context).colorScheme.tertiary,
      splashColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.15),
      highlightColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.25),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            icon ?? const SizedBox.shrink(),
            const SizedBox(width: 16),
          ],
          Text(
            title,
            style: titleStyle ??
                Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
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
      child: icon ??
          SvgPicture.asset(
            Assets.icons.icBack,
            width: 16,
            height: 16,
            color: isInverted
                ? Theme.of(context).colorScheme.onSurface
                : Theme.of(context).colorScheme.surface,
          ),
      onPressed: () {
        Get.back();
      },
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
