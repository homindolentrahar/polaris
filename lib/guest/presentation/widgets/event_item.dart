import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/core/domain/model/event.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/core/util/helper/string_helper.dart';
import 'package:polaris/gen/assets.gen.dart';

class EventItem extends StatelessWidget {
  final Event data;
  final ValueChanged<Event> onPressed;

  const EventItem({
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
        side: BorderSide(
          color: Get.theme.colorScheme.outline,
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: () => onPressed(data),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
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
                  const SizedBox(width: 8),
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
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              Assets.icons.icTicket,
                              width: 16,
                              height: 16,
                              color: Get.theme.primaryColor,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "Tiket tersedia",
                              style: Get.textTheme.headlineSmall?.copyWith(
                                color: Get.theme.primaryColor,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  InfoChip(
                    value: StringHelper.formatCompactCurrency(data.tickets
                        .firstWhere((element) => element.amount > 0)
                        .price),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                data.description,
                style: Get.textTheme.titleSmall?.copyWith(
                  color: Get.theme.colorScheme.tertiary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Divider(
                  color: Get.theme.colorScheme.tertiary.withOpacity(0.25),
                  thickness: 1.3,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Iconsax.calendar5,
                          color: Get.theme.colorScheme.onBackground,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          StringHelper.formatDate(dateTime: data.dateTime),
                          style: Get.textTheme.headlineSmall?.copyWith(
                            color: Get.theme.colorScheme.onBackground,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
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
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            data.venue.location,
                            overflow: TextOverflow.ellipsis,
                            style: Get.textTheme.headlineSmall?.copyWith(
                              color: Get.theme.colorScheme.onBackground,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
