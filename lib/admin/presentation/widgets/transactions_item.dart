import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/core/util/helper/string_helper.dart';
import 'package:polaris/gen/assets.gen.dart';
import 'package:polaris/gen/colors.gen.dart';

enum TransactionType { income, expense }

class TransactionsItem extends StatelessWidget {
  final TransactionType type;
  final VoidCallback onPressed;

  const TransactionsItem({
    super.key,
    required this.type,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Get.theme.colorScheme.outline),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        splashColor: Get.theme.colorScheme.onSurface.withOpacity(0.015),
        highlightColor: Get.theme.colorScheme.onSurface.withOpacity(0.025),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconContainer(
                    icon: Icon(
                      Iconsax.money_recive5,
                      color: Get.theme.colorScheme.onSurface,
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
                          "INV-1332132344",
                          style: Get.textTheme.headlineSmall?.copyWith(
                            color: Get.theme.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Wrap(
                          direction: Axis.horizontal,
                          spacing: 4,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Iconsax.calendar5,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  StringHelper.formatDate(
                                      dateTime: DateTime.now()),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground),
                                ),
                              ],
                            ),
                            Text(
                              "•",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Iconsax.clock5,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                  size: 16,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  StringHelper.formatTime(
                                    dateTime: DateTime.now(),
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "GoPay",
                          style: Get.textTheme.headlineSmall?.copyWith(
                            color: Get.theme.primaryColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  InfoChip(
                    value: StringHelper.formatCompactCurrency(25000),
                    valueColor: type == TransactionType.expense
                        ? ColorName.error
                        : ColorName.success,
                    color: (type == TransactionType.expense
                            ? ColorName.error
                            : ColorName.success)
                        .withOpacity(0.25),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: DashedLines(
                  length: double.infinity,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.calendar_15,
                        color: Theme.of(context).colorScheme.onBackground,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "Matsuri UII 2023",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color:
                                    Theme.of(context).colorScheme.onBackground),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.icons.icUser,
                        color: Theme.of(context).colorScheme.onBackground,
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "Jorgen Faunder",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color:
                                    Theme.of(context).colorScheme.onBackground),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
