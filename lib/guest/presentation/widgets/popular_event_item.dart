import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/core/util/helper/string_helper.dart';
import 'package:polaris/gen/assets.gen.dart';

class PopularEventItem extends StatelessWidget {
  final String id;
  final ValueChanged<String> onPressed;

  const PopularEventItem({
    super.key,
    required this.id,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(""),
      child: SizedBox(
        width: 232,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Hero(
                  tag: id,
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
                      child: Image.network(
                        "https://images.unsplash.com/photo-1684779847639-fbcc5a57dfe9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80",
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
                        "Matsuri UII 2023",
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
                            "14 Apr 2023",
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
                              "Sleman, Yogyakarta",
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
                value: StringHelper.formatCompactCurrency(25000),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
