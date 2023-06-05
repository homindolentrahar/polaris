import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/core/domain/model/analytics.dart';
import 'package:polaris/core/domain/model/event.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/core/util/helper/string_helper.dart';
import 'package:polaris/gen/assets.gen.dart';

class StatsItem extends StatelessWidget {
  final Event data;
  final Analytic analytic;
  final bool isShowTickets;
  final ValueChanged<Event> onPressed;

  const StatsItem({
    super.key,
    required this.data,
    required this.analytic,
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
        onTap: () => onPressed(data),
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
                      data.title,
                      style: Get.textTheme.headlineMedium?.copyWith(
                        color: Get.theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      StringHelper.formatDate(dateTime: data.dateTime),
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
                                color: Get.theme.colorScheme.secondary,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "${data.tickets.length} tipe tiket",
                                style: Get.textTheme.headlineSmall?.copyWith(
                                  color: Get.theme.colorScheme.secondary,
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
                              analytic.views.toString(),
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
                              analytic.clicks.toString(),
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
                              "${analytic.ctr}%",
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
