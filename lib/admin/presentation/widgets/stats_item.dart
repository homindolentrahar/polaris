import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/core/util/helper/string_helper.dart';
import 'package:polaris/gen/assets.gen.dart';

class StatsItem extends StatelessWidget {
  final bool isShowTickets;
  final VoidCallback onPressed;

  const StatsItem({
    super.key,
    this.isShowTickets = true,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Get.theme.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: Get.theme.colorScheme.outline,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        splashColor: Get.theme.colorScheme.onSurface.withOpacity(0.05),
        highlightColor: Get.theme.colorScheme.onSurface.withOpacity(0.1),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconContainer(
                icon: Icon(
                  Iconsax.chart_15,
                  color: Get.theme.primaryColor,
                  size: 20,
                ),
                backgroundColor: Get.theme.primaryColor.withOpacity(0.15),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Matsuri Jogja 2023",
                      style: Get.textTheme.headlineMedium?.copyWith(
                        color: Get.theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      StringHelper.formatDate(dateTime: DateTime.now()),
                      style: Get.textTheme.titleSmall?.copyWith(
                        color: Get.theme.colorScheme.onBackground,
                      ),
                    ),
                    Visibility(
                      visible: isShowTickets,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 8),
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
                                "5 tiket tersisa",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.error,
                                      fontSize: 12,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 8,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Iconsax.eye4,
                              color: Get.theme.colorScheme.tertiary,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "220",
                              style: Get.textTheme.headlineSmall?.copyWith(
                                color: Get.theme.colorScheme.tertiary,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Iconsax.mouse5,
                              color: Get.theme.colorScheme.tertiary,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "456",
                              style: Get.textTheme.headlineSmall?.copyWith(
                                color: Get.theme.colorScheme.tertiary,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Iconsax.electricity5,
                              color: Get.theme.colorScheme.tertiary,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "25%",
                              style: Get.textTheme.headlineSmall?.copyWith(
                                color: Get.theme.colorScheme.tertiary,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
