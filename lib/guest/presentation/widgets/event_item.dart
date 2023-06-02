import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/core/util/helper/string_helper.dart';
import 'package:polaris/gen/assets.gen.dart';

class EventItem extends StatelessWidget {
  final String id;
  final ValueChanged<String> onPressed;

  const EventItem({super.key, required this.id, required this.onPressed});

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
        onTap: () => onPressed(id),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: id,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        "https://images.unsplash.com/photo-1684779847639-fbcc5a57dfe9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80",
                        width: 56,
                        height: 56,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
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
                    value: StringHelper.formatCompactCurrency(25000),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                "Lorem ipsum dolor sit met Lorem ipsum dolor sit met Lorem ipsum dolor sit met",
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
                  Row(
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
                        StringHelper.formatDate(dateTime: DateTime.now()),
                        style: Get.textTheme.headlineSmall?.copyWith(
                          color: Get.theme.colorScheme.onBackground,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.location5,
                        color: Get.theme.colorScheme.onBackground,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "Sleman, Yogyakarta",
                        style: Get.textTheme.headlineSmall?.copyWith(
                          color: Get.theme.colorScheme.onBackground,
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
      ),
    );
  }
}
