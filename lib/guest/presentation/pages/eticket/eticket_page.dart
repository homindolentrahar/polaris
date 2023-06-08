import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/core/presentation/widgets/buttons.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/core/presentation/widgets/tabs.dart';
import 'package:polaris/core/util/helper/snackbar_helper.dart';
import 'package:polaris/gen/assets.gen.dart';
import 'package:polaris/guest/presentation/pages/eticket/eticket_controller.dart';

class EticketPage extends StatelessWidget {
  const EticketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EticketController>(
      builder: (controller) {
        return Scaffold(
          appBar: PrimaryAppBar(
            title: "E-Tiket",
            leadingIcon: Icon(
              Icons.close,
              color: Get.theme.colorScheme.surface,
              size: 16,
            ),
            onLeadingPressed: () {
              Get.back();
            },
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(16),
            child: PrimaryButton(
              icon: Icon(
                Iconsax.import_1,
                color: Get.theme.colorScheme.onPrimary,
                size: 20,
              ),
              title: "Unduh",
              onPressed: () {
                SnackbarHelper.showSnackbar(
                  title: "Mengunduh Tiket",
                  message:
                      "Tiket anda akan disimpan dalam bentuk dokumen (PDF)",
                  icon: Icon(
                    Iconsax.import_1,
                    color: Get.theme.colorScheme.surface,
                  ),
                );
              },
            ),
          ),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Visibility(
                  visible: controller.tickets.length > 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PrimaryCarouselBar(
                        activeIndex: controller.carouselIndex,
                        itemCount: controller.tickets.length,
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: controller.pageController,
                    itemCount: controller.tickets.length,
                    onPageChanged: (index) {
                      controller.onCarouselChanged(index);
                    },
                    itemBuilder: (ctx, index) {
                      final ticket = controller.tickets[index];

                      return SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 32,
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: Get.width,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Get.theme.colorScheme.surface,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Get.theme.colorScheme.outline,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: CachedNetworkImage(
                                      imageUrl: ticket.imageUrl,
                                      width: double.infinity,
                                      height: 160,
                                      fit: BoxFit.fill,
                                      alignment: Alignment.topCenter,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    ticket.type.toUpperCase(),
                                    style:
                                        Get.textTheme.headlineSmall?.copyWith(
                                      color: Get.theme.primaryColor,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    ticket.title,
                                    style:
                                        Get.textTheme.headlineLarge?.copyWith(
                                      color: Get.theme.colorScheme.onSurface,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Gunakan tiket ini dengan scan barcode di pintu masuk venue event",
                                    style: Get.textTheme.titleMedium?.copyWith(
                                      color: Get.theme.colorScheme.tertiary,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 16,
                                    ),
                                    child: Divider(
                                      color: Get.theme.colorScheme.tertiary
                                          .withOpacity(0.25),
                                      thickness: 1,
                                    ),
                                  ),
                                  Wrap(
                                    runSpacing: 8,
                                    children: controller
                                        .getGrouppedInfos(data: ticket)
                                        .map(
                                          (items) => Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: items
                                                .asMap()
                                                .entries
                                                .map(
                                                  (e) => DetailInfo(
                                                    title: e.value.title,
                                                    value: e.value.value,
                                                    align: e.key == 1
                                                        ? CrossAxisAlignment.end
                                                        : CrossAxisAlignment
                                                            .start,
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    child: DashedLines(
                                      length: double.infinity,
                                      color: Get.theme.colorScheme.tertiary
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                  Image.asset(
                                    Assets.images.barcode.path,
                                    height: 100,
                                  ),
                                  const SizedBox(height: 8),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      ticket.uniqueCode.toUpperCase(),
                                      style:
                                          Get.textTheme.headlineSmall?.copyWith(
                                        color: Get.theme.colorScheme.onSurface,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
