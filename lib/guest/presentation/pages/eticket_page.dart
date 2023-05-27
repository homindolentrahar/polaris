import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/core/presentation/widgets/buttons.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/gen/assets.gen.dart';
import 'package:polaris/guest/presentation/applications/eticket_page_controller.dart';

class EticketPage extends StatelessWidget {
  const EticketPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            Iconsax.import,
            color: Get.theme.colorScheme.onPrimary,
            size: 20,
          ),
          title: "Unduh",
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 32,
          ),
          child: GetBuilder(
              init: EticketPageController(),
              builder: (controller) {
                return Column(
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
                            child: Image.network(
                              "https://images.unsplash.com/photo-1684779847639-fbcc5a57dfe9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80",
                              width: double.infinity,
                              height: 160,
                              fit: BoxFit.fill,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Reguler".toUpperCase(),
                            style: Get.textTheme.headlineSmall?.copyWith(
                              color: Get.theme.primaryColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Matsuri UII 2023",
                            style: Get.textTheme.headlineLarge?.copyWith(
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
                                .getGrouppedInfos()
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
                                                : CrossAxisAlignment.start,
                                          ),
                                        )
                                        .toList(),
                                  ),
                                )
                                .toList(),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
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
                              "#8mj42432jsnnolps9".toUpperCase(),
                              style: Get.textTheme.headlineSmall?.copyWith(
                                color: Get.theme.colorScheme.onSurface,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
