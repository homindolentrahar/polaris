import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/core/domain/model/transaction.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/core/util/helper/string_helper.dart';
import 'package:polaris/gen/assets.gen.dart';
import 'package:polaris/gen/colors.gen.dart';

class TransactionsItem extends StatelessWidget {
  final Transaction data;
  final ValueChanged<Transaction> onPressed;

  const TransactionsItem({
    super.key,
    required this.data,
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
        onTap: () => onPressed(data),
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
                          data.invoiceCode,
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
                                  color: Get.theme.colorScheme.onBackground,
                                  size: 12,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  StringHelper.formatDate(
                                    dateTime: data.dateTime,
                                  ),
                                  style: Get.textTheme.titleSmall?.copyWith(
                                    color: Get.theme.colorScheme.onBackground,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "•",
                              style: Get.textTheme.titleSmall?.copyWith(
                                color: Get.theme.colorScheme.onBackground,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Iconsax.clock5,
                                  color: Get.theme.colorScheme.onBackground,
                                  size: 12,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  StringHelper.formatTime(
                                    dateTime: data.dateTime,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Get.textTheme.titleSmall?.copyWith(
                                    color: Get.theme.colorScheme.onBackground,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        RichText(
                          text: TextSpan(
                            style: Get.textTheme.bodySmall?.copyWith(
                              color: Get.theme.colorScheme.onBackground,
                            ),
                            children: [
                              TextSpan(
                                text: StringHelper.formatCompactCurrency(
                                  data.price,
                                ),
                                style: Get.textTheme.headlineSmall?.copyWith(
                                  color: data.paid
                                      ? ColorName.success
                                      : ColorName.error,
                                  fontSize: 12,
                                ),
                              ),
                              const TextSpan(
                                text: " via ",
                              ),
                              TextSpan(
                                text: data.paymentName,
                                style: Get.textTheme.headlineSmall?.copyWith(
                                  color: Get.theme.primaryColor,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  InfoChip(
                    value: data.paid ? "Lunas" : "Belum Lunas",
                    valueColor: data.paid ? ColorName.success : ColorName.error,
                    color: (data.paid ? ColorName.success : ColorName.error)
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
                        color: Get.theme.colorScheme.onBackground,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        data.eventName,
                        style: Get.textTheme.titleMedium?.copyWith(
                          color: Get.theme.colorScheme.onBackground,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.icons.icUser,
                        color: Get.theme.colorScheme.onBackground,
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        data.user,
                        style: Get.textTheme.titleMedium?.copyWith(
                          color: Get.theme.colorScheme.onBackground,
                        ),
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
