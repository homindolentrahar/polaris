import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:polaris/core/domain/model/event.dart';
import 'package:polaris/core/presentation/widgets/buttons.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/gen/assets.gen.dart';

class MapDirection extends StatelessWidget {
  final String location;
  final String locationAddress;
  final String destination;
  final String destinationAddress;
  final double length;
  final double estimatedTime;
  final VoidCallback onSeeMapPressed;

  const MapDirection({
    super.key,
    required this.location,
    required this.locationAddress,
    required this.destination,
    required this.destinationAddress,
    required this.length,
    required this.estimatedTime,
    required this.onSeeMapPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 112,
          child: Stack(
            children: [
              ShaderMask(
                shaderCallback: (rect) => LinearGradient(
                  colors: [
                    Get.theme.colorScheme.onSurface.withOpacity(0.75),
                    Get.theme.colorScheme.onSurface.withOpacity(0.50),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ).createShader(rect),
                blendMode: BlendMode.srcATop,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Image.asset(
                    Assets.images.map.path,
                    fit: BoxFit.cover,
                    height: double.infinity,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: PrimaryButton(
                  icon: Icon(
                    Iconsax.map_15,
                    color: Get.theme.colorScheme.onSurface,
                    size: 16,
                  ),
                  title: "Lihat Peta",
                  titleStyle: Get.textTheme.headlineSmall?.copyWith(
                    color: Get.theme.colorScheme.onSurface,
                    fontSize: 12,
                  ),
                  backgroundColor: Get.theme.colorScheme.surface,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  radius: 16,
                  onPressed: onSeeMapPressed,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            border: Border.all(
              color: Get.theme.colorScheme.outline,
              width: 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Arahan Lokasi",
                    style: Get.textTheme.headlineSmall?.copyWith(
                      color: Get.theme.colorScheme.onSurface,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${length}km",
                        style: Get.textTheme.titleSmall?.copyWith(
                          color: Get.theme.colorScheme.onBackground,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "•",
                        style: Get.textTheme.titleSmall?.copyWith(
                          color: Get.theme.colorScheme.onBackground,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "${estimatedTime.toInt()}min",
                        style: Get.textTheme.titleSmall?.copyWith(
                          color: Get.theme.colorScheme.onBackground,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(8),
                child: DottedLine(
                  dashColor: Get.theme.colorScheme.outline,
                  dashGapLength: 8,
                  dashLength: 8,
                  lineThickness: 1,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Wrap(
                    direction: Axis.vertical,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 4,
                    children: [
                      Icon(
                        Iconsax.location5,
                        color: Get.theme.colorScheme.onBackground,
                        size: 20,
                      ),
                      DottedLine(
                        direction: Axis.vertical,
                        dashColor: Get.theme.colorScheme.tertiary,
                        dashGapLength: 8,
                        dashLength: 4,
                        lineThickness: 1,
                        lineLength: 64,
                      ),
                      SvgPicture.asset(
                        Assets.icons.icDirection,
                        color: Get.theme.colorScheme.onBackground,
                        width: 20,
                        height: 20,
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lokasimu",
                          style: Get.textTheme.titleSmall?.copyWith(
                            color: Get.theme.colorScheme.tertiary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          location,
                          style: Get.textTheme.headlineSmall?.copyWith(
                            color: Get.theme.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          locationAddress,
                          style: Get.textTheme.titleSmall?.copyWith(
                            color: Get.theme.colorScheme.onBackground,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Lokasi Event",
                          style: Get.textTheme.titleSmall?.copyWith(
                            color: Get.theme.colorScheme.tertiary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          destination,
                          style: Get.textTheme.headlineSmall?.copyWith(
                            color: Get.theme.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          destinationAddress,
                          style: Get.textTheme.titleSmall?.copyWith(
                            color: Get.theme.colorScheme.onBackground,
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
      ],
    );
  }
}

class MapPicker extends StatelessWidget {
  final String name;

  const MapPicker({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 112,
          child: Stack(
            children: [
              ShaderMask(
                shaderCallback: (rect) => LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.75),
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.50),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ).createShader(rect),
                blendMode: BlendMode.srcATop,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Image.asset(
                    Assets.images.map.path,
                    fit: BoxFit.cover,
                    height: double.infinity,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: PrimaryButton(
                  icon: Icon(
                    Iconsax.map_15,
                    color: Theme.of(context).colorScheme.onSurface,
                    size: 16,
                  ),
                  title: "Lihat Peta",
                  titleStyle:
                      Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontSize: 12,
                          ),
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  radius: 16,
                  onPressed: () {
                    MapsLauncher.launchQuery(
                      '1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            border: Border.all(
              color: Theme.of(context).colorScheme.outline,
              width: 1,
            ),
          ),
          child: FormTextField(
            name: name,
            hint: "Pilih Tempat",
            suffixIcon: Icon(
              Iconsax.location5,
              color: Get.theme.colorScheme.tertiary,
              size: 16,
            ),
          ),
        ),
      ],
    );
  }
}

class MapVenueInfo extends StatelessWidget {
  final EventVenue? venue;

  const MapVenueInfo({super.key, required this.venue});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 112,
          child: Stack(
            children: [
              ShaderMask(
                shaderCallback: (rect) => LinearGradient(
                  colors: [
                    Get.theme.colorScheme.onSurface.withOpacity(0.75),
                    Get.theme.colorScheme.onSurface.withOpacity(0.50),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ).createShader(rect),
                blendMode: BlendMode.srcATop,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Image.asset(
                    Assets.images.map.path,
                    fit: BoxFit.cover,
                    height: double.infinity,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: PrimaryButton(
                  icon: Icon(
                    Iconsax.map_15,
                    color: Get.theme.colorScheme.onSurface,
                    size: 16,
                  ),
                  title: "Lihat Peta",
                  titleStyle: Get.textTheme.headlineSmall?.copyWith(
                    color: Get.theme.colorScheme.onSurface,
                    fontSize: 12,
                  ),
                  backgroundColor: Get.theme.colorScheme.surface,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  radius: 16,
                  onPressed: () {
                    MapsLauncher.launchQuery(
                      '1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            border: Border.all(
              color: Theme.of(context).colorScheme.outline,
              width: 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Kapasitas Venue",
                    style: Get.textTheme.headlineSmall?.copyWith(
                      color: Get.theme.colorScheme.onSurface,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.profile_2user5,
                        size: 16,
                        color: Get.theme.colorScheme.onBackground,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "${venue?.capacity} orang",
                        style: Get.textTheme.headlineSmall?.copyWith(
                          color: Get.theme.colorScheme.onBackground,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: DashedLines(length: double.infinity),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Iconsax.location5,
                    color: Get.theme.colorScheme.onBackground,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lokasi Event",
                          style: Get.textTheme.titleSmall?.copyWith(
                            color: Get.theme.colorScheme.tertiary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          venue?.location ?? "",
                          style: Get.textTheme.headlineSmall?.copyWith(
                            color: Get.theme.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          venue?.address ?? "",
                          style: Get.textTheme.titleSmall?.copyWith(
                            color: Get.theme.colorScheme.onBackground,
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
      ],
    );
  }
}
