import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:polaris/core/domain/model/event.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/core/util/helper/string_helper.dart';
import 'package:polaris/gen/assets.gen.dart';

class PopularEventItem extends StatelessWidget {
  final Event data;
  final ValueChanged<Event> onPressed;

  const PopularEventItem({
    super.key,
    required this.data,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(data),
      child: SizedBox(
        width: 232,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Hero(
                  tag: data.id,
                  child: ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [
                        Get.theme.colorScheme.onSurface.withOpacity(0),
                        Get.theme.colorScheme.onSurface,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ).createShader(bounds),
                    blendMode: BlendMode.srcATop,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: data.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 248,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Get.theme.colorScheme.onSurface,
                    border: Border.all(
                      width: 0.0,
                      strokeAlign: 0,
                      color: Get.theme.colorScheme.onSurface,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
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
                            "Tiket tersedia",
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
                        style: Get.textTheme.headlineMedium?.copyWith(
                          color: Get.theme.colorScheme.surface,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            StringHelper.formatDate(dateTime: data.dateTime),
                            style: Get.textTheme.titleSmall?.copyWith(
                              color: Get.theme.colorScheme.tertiary,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "•",
                            style: Get.textTheme.titleSmall?.copyWith(
                              color: Get.theme.colorScheme.tertiary,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              data.venue.location,
                              overflow: TextOverflow.ellipsis,
                              style: Get.textTheme.titleSmall?.copyWith(
                                color: Get.theme.colorScheme.tertiary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 16,
              right: 16,
              child: InfoChip(
                value: StringHelper.formatCompactCurrency(
                  data.tickets
                      .firstWhere((element) => element.amount > 0)
                      .price,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
