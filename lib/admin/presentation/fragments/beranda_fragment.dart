import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/admin/presentation/application/beranda_controller.dart';
import 'package:polaris/admin/presentation/widgets/admin_event_item.dart';
import 'package:polaris/admin/presentation/widgets/beranda_summary.dart';
import 'package:polaris/core/presentation/application/auth_controller.dart';
import 'package:polaris/core/presentation/widgets/buttons.dart';
import 'package:polaris/core/util/helper/log_helper.dart';
import 'package:polaris/route/app_route.dart';

class BerandaFragment extends StatelessWidget {
  const BerandaFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: GetBuilder(
          init: BerandaController(),
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Selamat datang!",
                          style: Get.textTheme.titleSmall
                              ?.copyWith(color: Get.theme.colorScheme.tertiary),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Himpunan Mahasiswa Atep",
                          style: Get.textTheme.headlineMedium?.copyWith(
                            color: Get.theme.colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                    PopupMenuButton(
                      offset: const Offset(0, 56),
                      onSelected: (value) {
                        LogHelper.instance.info(value);

                        if (value == 'logout') {
                          Get.find<AuthController>().logout();
                        }
                      },
                      itemBuilder: (ctx) => [
                        PopupMenuItem(
                          value: "logout",
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Iconsax.logout5,
                                color: Get.theme.colorScheme.error,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "Logout",
                                style: Get.textTheme.headlineSmall?.copyWith(
                                  color: Get.theme.colorScheme.error,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: Image.network(
                          "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                BerandaSummary(
                  items: controller.summaries,
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Semua Event",
                      style: Get.textTheme.titleMedium
                          ?.copyWith(color: Get.theme.colorScheme.onSurface),
                    ),
                    PrimaryTextButton(
                      title: "Lihat Semua",
                      onPressed: () {
                        Get.toNamed(AppRoutes.adminEvents);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemBuilder: (ctx, index) => AdminEventItem(
                    onPressed: () {
                      Get.toNamed(
                        "${AppRoutes.adminEvents}/1",
                        arguments: 0,
                      );
                    },
                  ),
                ),
              ],
            );
          }),
    );
  }
}
