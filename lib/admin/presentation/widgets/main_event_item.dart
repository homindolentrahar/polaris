import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/core/domain/model/event.dart';
import 'package:polaris/core/util/helper/string_helper.dart';
import 'package:polaris/gen/assets.gen.dart';

class MainEventItem extends StatelessWidget {
  final Event data;
  final ValueChanged<Event> onPressed;

  const MainEventItem({
    super.key,
    required this.data,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Get.theme.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Get.theme.colorScheme.outline),
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
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: data.imageUrl,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    const SizedBox(height: 8),
                    Text(
                      data.title,
                      style: Get.textTheme.headlineSmall?.copyWith(
                        color: Get.theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
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
                              color: Get.theme.colorScheme.onBackground,
                              size: 16,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              StringHelper.formatDate(dateTime: data.dateTime),
                              style: Get.textTheme.titleMedium?.copyWith(
                                color: Get.theme.colorScheme.onBackground,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "•",
                          style: Get.textTheme.titleMedium?.copyWith(
                            color: Get.theme.colorScheme.onBackground,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Iconsax.location5,
                                color: Get.theme.colorScheme.onBackground,
                                size: 16,
                              ),
                              const SizedBox(width: 2),
                              Expanded(
                                child: Text(
                                  data.venue.location,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Get.textTheme.titleMedium?.copyWith(
                                    color: Get.theme.colorScheme.onBackground,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
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
                              data.analytics.views.toString(),
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
                              data.analytics.clicks.toString(),
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
                              "${data.analytics.ctr}%",
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
