import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/core/presentation/widgets/maps.dart';
import 'package:polaris/guest/presentation/pages/detail/detail_event_controller.dart';
import 'package:readmore/readmore.dart';

class DetailEventInfoFragment extends StatelessWidget {
  const DetailEventInfoFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailEventController>(
      builder: (controller) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PrimarySubtitle(subtitle: "Deskripsi"),
              const SizedBox(height: 8),
              ReadMoreText(
                controller.event?.description ?? "",
                style: Get.textTheme.bodySmall?.copyWith(
                  color: Get.theme.colorScheme.onBackground,
                ),
                moreStyle: Get.textTheme.headlineSmall?.copyWith(
                  color: Get.theme.primaryColor,
                  fontSize: 12,
                ),
                lessStyle: Get.textTheme.headlineSmall?.copyWith(
                  color: Get.theme.primaryColor,
                  fontSize: 12,
                ),
                trimLines: 3,
                trimMode: TrimMode.Line,
                trimExpandedText: "Sembunyikan",
                trimCollapsedText: "Selengkapnya",
              ),
              const SizedBox(height: 16),
              const PrimarySubtitle(subtitle: "Tempat"),
              const SizedBox(height: 8),
              MapDirection(
                destination: controller.event?.venue.name ?? "",
                destinationAddress: controller.event?.venue.address ?? "",
                location: "Rumah",
                locationAddress: controller.event?.venue.address ?? "",
                estimatedTime: 34,
                length: 24,
                onSeeMapPressed: () {},
              ),
              const SizedBox(height: 16),
              const PrimarySubtitle(subtitle: "Narahubung"),
              const SizedBox(height: 8),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.event?.contacts.length ?? 0,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (ctx, index) => ContactOrganizerItem(
                  imageUrl: controller.event?.contacts[index].imageUrl ?? "",
                  title: controller.event?.contacts[index].name ?? "",
                  subtitle: controller.event?.contacts[index].position ?? "",
                  onCall: () {},
                ),
              ),
              const SizedBox(height: 16),
              const PrimarySubtitle(subtitle: "Penyelenggara"),
              const SizedBox(height: 8),
              ContactOrganizerItem(
                imageUrl: controller.event?.author.imageUrl ?? "",
                title: controller.event?.author.name ?? "",
                subtitle: controller.event?.author.description ?? "",
                onCall: () {},
              )
            ],
          ),
        );
      },
    );
  }
}
