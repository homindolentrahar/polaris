import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/core/presentation/widgets/buttons.dart';

class LocationInfo extends StatelessWidget {
  final ValueChanged<String> onLocationPicked;

  const LocationInfo({super.key, required this.onLocationPicked});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PrimaryIconButton(
          icon: Icon(
            Iconsax.location5,
            size: 16,
            color: Get.theme.colorScheme.tertiary,
          ),
          onPressed: () => onLocationPicked(""),
        ),
        const SizedBox(width: 16),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Lokasimu",
              style: Get.textTheme.bodySmall?.copyWith(
                color: Get.theme.colorScheme.tertiary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Sleman, Yogyakarta",
              style: Get.textTheme.headlineSmall?.copyWith(
                color: Get.theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
