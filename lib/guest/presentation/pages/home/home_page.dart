import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/core/presentation/application/auth_controller.dart';
import 'package:polaris/core/presentation/widgets/buttons.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/core/presentation/widgets/filters.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/core/util/helper/log_helper.dart';
import 'package:polaris/gen/assets.gen.dart';
import 'package:polaris/guest/presentation/pages/home/home_controller.dart';
import 'package:polaris/guest/presentation/widgets/guest_event_item.dart';
import 'package:polaris/guest/presentation/widgets/location_info.dart';
import 'package:polaris/guest/presentation/widgets/popular_event_item.dart';
import 'package:polaris/route/app_route.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LocationInfo(
                    onLocationPicked: (value) {},
                  ),
                  PopupMenuButton(
                    offset: const Offset(0, 32),
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
                    child: IconContainer(
                      icon: SvgPicture.asset(
                        Assets.icons.icUser,
                        width: 16,
                        height: 16,
                        color: Get.theme.colorScheme.surface,
                      ),
                      radius: 32,
                      backgroundColor: Get.theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              FormSearchField(
                name: "search_event",
                hint: "Cari event",
                enabled: false,
                onTap: () {
                  Get.toNamed(AppRoutes.searchKey);
                },
                onSubmit: (value) {},
              ),
              const SizedBox(height: 16),
              FilterEventSelector(
                models: controller.filters,
                onFilterSelected: (value) {},
              ),
              const SizedBox(height: 32),
              const PrimarySubtitle(subtitle: "Event Populer"),
              const SizedBox(height: 16),
              SizedBox(
                height: 352,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  separatorBuilder: (ctx, index) => const SizedBox(
                    width: 16,
                  ),
                  itemBuilder: (ctx, index) => PopularEventItem(
                    id: index.toString(),
                    onPressed: (value) {
                      Get.toNamed(
                        "${AppRoutes.event}/$index",
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 32),
              PrimarySubtitle(
                subtitle: "Terkini",
                trailing: PrimaryTextButton(
                  title: "Lihat Semua",
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 16),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                separatorBuilder: (ctx, index) => const SizedBox(
                  height: 16,
                ),
                itemBuilder: (ctx, index) => GuestEventItem(
                  id: "${index}_euy",
                  onPressed: (value) {
                    Get.toNamed("${AppRoutes.event}/${index}_euy");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
