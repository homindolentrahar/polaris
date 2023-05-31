import 'dart:developer';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/core/domain/model/payment_type_model.dart';
import 'package:polaris/core/domain/model/ticket_type_model.dart';
import 'package:polaris/core/presentation/widgets/buttons.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/core/presentation/widgets/tabs.dart';
import 'package:polaris/core/util/helper/string_helper.dart';
import 'package:polaris/gen/assets.gen.dart';
import 'package:readmore/readmore.dart';

class ContactOrganizerItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final VoidCallback onCall;

  const ContactOrganizerItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.onCall,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          PrimaryIconButton(
            icon: Icon(
              Iconsax.call5,
              color: Theme.of(context).colorScheme.onSurface,
              size: 16,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class DetailEventBanner extends StatelessWidget {
  final String title;
  final DateTime dateTime;
  final int ticketsLeft;
  final bool isAuthorVisible;
  final String? authorImageUrl;
  final String? authorName;

  const DetailEventBanner({
    super.key,
    required this.title,
    required this.dateTime,
    required this.ticketsLeft,
    this.isAuthorVisible = false,
    this.authorImageUrl,
    this.authorName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.15),
              blurRadius: 15,
            ),
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Iconsax.calendar5,
                    color: Theme.of(context).colorScheme.onBackground,
                    size: 16,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    StringHelper.formatDate(dateTime: dateTime),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                ],
              ),
              const SizedBox(width: 4),
              Text(
                "•",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              const SizedBox(width: 4),
              Text(
                StringHelper.formatTime(dateTime: dateTime),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                Assets.icons.icTicket,
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 4),
              Text(
                "$ticketsLeft tersisa",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Theme.of(context).colorScheme.error),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EventTicketSelector extends StatelessWidget {
  final int currentIndex;
  final int amount;
  final List<TicketTypeModel> tickets;
  final VoidCallback onDecreased;
  final VoidCallback onIncreased;
  final ValueChanged<int> onAmountChanged;
  final ValueChanged<int> onTabChanged;

  const EventTicketSelector({
    super.key,
    required this.currentIndex,
    required this.amount,
    required this.tickets,
    required this.onDecreased,
    required this.onIncreased,
    required this.onAmountChanged,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    log("Amount: $amount");

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PrimaryTabBar(
          isDense: true,
          currentIndex: currentIndex,
          titles: tickets.map((e) => e.title).toList(),
          onTabChanged: onTabChanged,
        ),
        const SizedBox(height: 16),
        IndexedStack(
          index: currentIndex,
          children: tickets
              .map(
                (e) => _EventTicketItem(
                  amount: amount,
                  data: e,
                  onDecreased: onDecreased,
                  onIncreased: onIncreased,
                  onAmountChanged: onAmountChanged,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _EventTicketItem extends StatelessWidget {
  final int amount;
  final TicketTypeModel data;
  final VoidCallback onDecreased;
  final VoidCallback onIncreased;
  final ValueChanged<int> onAmountChanged;

  const _EventTicketItem({
    required this.amount,
    required this.data,
    required this.onDecreased,
    required this.onIncreased,
    required this.onAmountChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringHelper.formatCurrency(data.price),
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    Assets.icons.icTicket,
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "${data.ticketsLeft} tersisa",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context).colorScheme.error,
                          fontSize: 12,
                        ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...List.generate(
            data.benefits.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    Assets.icons.icTick,
                    color: Theme.of(context).colorScheme.onSurface,
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    data.benefits[index],
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: DashedLines(
              length: double.infinity,
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.25),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FormAmountField(
                initialAmount: amount,
                name: "amount",
                hint: "Jumlah",
                maxAmount: data.ticketsLeft,
                onDecreased: onDecreased,
                onIncreased: onIncreased,
                onAmountChanged: onAmountChanged,
              ),
              Text(
                StringHelper.formatCurrency(amount * data.price),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DashedLines extends StatelessWidget {
  final Axis direction;
  final Color? color;
  final double width;
  final double gap;
  final double length;
  final double thickness;

  const DashedLines({
    super.key,
    this.direction = Axis.horizontal,
    this.color,
    this.width = 8,
    this.gap = 8,
    required this.length,
    this.thickness = 1,
  });

  @override
  Widget build(BuildContext context) {
    return DottedLine(
      dashColor:
          color ?? Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
      dashGapLength: gap,
      dashLength: width,
      direction: direction,
      lineLength: length,
      lineThickness: thickness,
    );
  }
}

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showLeading;
  final Widget? leadingIcon;
  final Color? leadingBackground;
  final EdgeInsets? leadingPadding;
  final double leadingRadius;
  final String title;
  final VoidCallback? onLeadingPressed;

  const PrimaryAppBar({
    super.key,
    this.showLeading = true,
    this.leadingIcon,
    this.leadingBackground,
    this.leadingPadding,
    this.leadingRadius = 32,
    required this.title,
    this.onLeadingPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: showLeading,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  leadingIcon != null
                      ? PrimaryIconButton(
                          icon: leadingIcon!,
                          onPressed: onLeadingPressed,
                          color: leadingBackground ??
                              Get.theme.colorScheme.onSurface,
                          radius: leadingRadius,
                          padding: leadingPadding,
                        )
                      : PrimaryBackButton(
                          onBackAction: onLeadingPressed,
                        ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(72);
}

class PaymentTypeItem extends StatelessWidget {
  final PaymentTypeModel data;
  final bool isSelected;
  final bool isSelectable;
  final ValueChanged<PaymentTypeModel>? onPaymentSelected;

  const PaymentTypeItem({
    super.key,
    required this.data,
    this.isSelected = false,
    this.isSelectable = false,
    this.onPaymentSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Get.theme.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Get.theme.colorScheme.outline, width: 1),
      ),
      child: InkWell(
        onTap: isSelectable
            ? () {
                onPaymentSelected?.call(data);
              }
            : null,
        borderRadius: BorderRadius.circular(8),
        splashColor: Get.theme.colorScheme.onSurface.withOpacity(0.03),
        highlightColor: Get.theme.colorScheme.onSurface.withOpacity(0.06),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconContainer(
                backgroundColor: isSelected
                    ? Get.theme.colorScheme.onSurface
                    : Get.theme.colorScheme.background,
                icon: Icon(
                  Iconsax.money_recive,
                  color: isSelected
                      ? Get.theme.colorScheme.surface
                      : Get.theme.colorScheme.onBackground,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.name,
                      style: Get.theme.textTheme.headlineSmall?.copyWith(
                        color: Get.theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 4,
                      children: [
                        Text(
                          data.value,
                          style: Get.textTheme.titleSmall?.copyWith(
                              color: Get.theme.colorScheme.onBackground),
                        ),
                        Text(
                          "•",
                          style: Get.textTheme.titleSmall?.copyWith(
                              color: Get.theme.colorScheme.onBackground),
                        ),
                        Text(
                          data.correspondent,
                          style: Get.textTheme.titleSmall?.copyWith(
                              color: Get.theme.colorScheme.onBackground),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isSelectable,
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: SvgPicture.asset(
                        isSelected
                            ? Assets.icons.icSelected
                            : Assets.icons.icUnselected,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  final Widget icon;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final double radius;

  const IconContainer({
    super.key,
    required this.icon,
    this.backgroundColor,
    this.padding,
    this.radius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor ?? Get.theme.colorScheme.background,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: icon,
    );
  }
}

class DetailInfo extends StatelessWidget {
  final String title;
  final String value;
  final CrossAxisAlignment align;

  const DetailInfo({
    super.key,
    required this.title,
    required this.value,
    this.align = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: align,
      children: [
        Text(
          title,
          style: Get.textTheme.titleSmall
              ?.copyWith(color: Get.theme.colorScheme.onBackground),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: Get.textTheme.headlineSmall
              ?.copyWith(color: Get.theme.colorScheme.onSurface),
        ),
      ],
    );
  }
}

class InfoChip extends StatelessWidget {
  final String value;
  final Color? valueColor;
  final Color? color;
  final double radius;
  final EdgeInsets? padding;

  const InfoChip({
    super.key,
    required this.value,
    this.valueColor,
    this.color,
    this.radius = 32,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
      decoration: BoxDecoration(
        color: color ?? Get.theme.colorScheme.onSurface,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Center(
        child: Text(
          value,
          style: Get.textTheme.headlineSmall?.copyWith(
            color: valueColor ?? Get.theme.colorScheme.surface,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

class TicketTypeItem extends StatelessWidget {
  final TicketTypeModel data;

  const TicketTypeItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Get.theme.colorScheme.outline),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconContainer(
                icon: SvgPicture.asset(
                  Assets.icons.icTicket,
                  color: Get.theme.colorScheme.tertiary,
                  width: 20,
                  height: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Reguler",
                      style: Get.textTheme.headlineMedium
                          ?.copyWith(color: Get.theme.colorScheme.onSurface),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "200 tiket",
                      style: Get.textTheme.titleSmall
                          ?.copyWith(color: Get.theme.colorScheme.onBackground),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              InfoChip(value: StringHelper.formatCompactCurrency(25000)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: DashedLines(
              length: Get.width,
              color: Get.theme.colorScheme.tertiary.withOpacity(0.25),
            ),
          ),
          ...List.generate(
            data.benefits.take(3).length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    Assets.icons.icTick,
                    color: Theme.of(context).colorScheme.onBackground,
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    data.benefits[index],
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: data.benefits.length > 3,
              child: PrimaryTextButton(
                title: "Selengkapnya +${data.benefits.length - 3}",
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DateSelector extends StatelessWidget {
  final Widget? icon;
  final String title;
  final ValueChanged<DateTime?> onDateSelected;

  const DateSelector({
    super.key,
    this.icon,
    required this.title,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Get.theme.colorScheme.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: Get.theme.colorScheme.outline,
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: () {},
        splashColor: Get.theme.colorScheme.onSurface.withOpacity(0.015),
        highlightColor: Get.theme.colorScheme.onSurface.withOpacity(0.025),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: Get.textTheme.headlineSmall?.copyWith(
                  color: Get.theme.colorScheme.tertiary,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Iconsax.arrow_down_1,
                color: Get.theme.colorScheme.tertiary,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PrimarySubtitle extends StatelessWidget {
  final String subtitle;
  final double fontSize;
  final Widget? trailing;

  const PrimarySubtitle({
    super.key,
    required this.subtitle,
    this.fontSize = 14,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          subtitle,
          style: Get.textTheme.titleMedium?.copyWith(
            color: Get.theme.colorScheme.onSurface,
            fontSize: fontSize,
          ),
        ),
        trailing ?? const SizedBox.shrink(),
      ],
    );
  }
}

class ShowMoreText extends StatelessWidget {
  final String value;
  final int trimLine;

  const ShowMoreText({
    super.key,
    required this.value,
    this.trimLine = 3,
  });

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      value,
      style: Theme.of(context)
          .textTheme
          .bodySmall
          ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
      moreStyle: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(color: Theme.of(context).primaryColor, fontSize: 12),
      lessStyle: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(color: Theme.of(context).primaryColor, fontSize: 12),
      trimLines: trimLine,
      trimMode: TrimMode.Line,
      trimExpandedText: "Sembunyikan",
      trimCollapsedText: "Selengkapnya",
    );
  }
}
