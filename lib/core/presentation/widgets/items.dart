import 'dart:developer';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/core/domain/model/ticket_type_model.dart';
import 'package:polaris/core/presentation/widgets/buttons.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/core/presentation/widgets/tabs.dart';
import 'package:polaris/core/util/helper/string_helper.dart';
import 'package:polaris/gen/assets.gen.dart';

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
                    StringHelper.formatDate(dateTime),
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
                StringHelper.formatTime(dateTime),
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
      dashColor: color ?? Theme.of(context).colorScheme.tertiary,
      dashGapLength: gap,
      dashLength: width,
      direction: direction,
      lineLength: length,
      lineThickness: thickness,
    );
  }
}
