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
import 'package:polaris/guest/presentation/widgets/event_item.dart';
import 'package:polaris/guest/presentation/widgets/location_info.dart';
import 'package:polaris/guest/presentation/widgets/popular_event_item.dart';
import 'package:polaris/route/app_route.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: GetBuilder<HomeController>(
            builder: (controller) {
              return Column(
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

                          if (value == 'signin') {
                            Get.find<AuthController>().logout();
                          }
                        },
                        itemBuilder: (ctx) => [
                          PopupMenuItem(
                            value: "signin",
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Iconsax.login,
                                  color: Get.theme.colorScheme.onSurface,
                                  size: 16,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "Masuk sebagai Pengelola Event",
                                  style: Get.textTheme.headlineSmall?.copyWith(
                                    color: Get.theme.colorScheme.onSurface,
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
                  FilterSelector(
                    selectedSort: controller.selectedSort,
                    selectedFilter: controller.selectedFilter,
                    sorts: controller.sorts,
                    filters: controller.filters,
                    sortTitle: "Urutkan Event",
                    onFilterSelected: controller.onFilterSelected,
                    onSortCleared: controller.clearSelectedSort,
                    onSortSelected: (value) async {
                      controller.onSortSelected(value);
                    },
                  ),
                  const SizedBox(height: 32),
                  const PrimarySubtitle(subtitle: "Event Populer"),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 352,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.events.length,
                      separatorBuilder: (ctx, index) =>
                          const SizedBox(width: 16),
                      itemBuilder: (ctx, index) => PopularEventItem(
                        data: controller.events[index],
                        onPressed: (value) {
                          Get.toNamed(
                            "${AppRoutes.guest}/${AppRoutes.events}/${value.id}",
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
                      onPressed: () {
                        Get.toNamed(
                          AppRoutes.searchResult,
                          arguments: {
                            'title': "Semua Event",
                            'value': null,
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.events.length,
                    separatorBuilder: (ctx, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (ctx, index) => EventItem(
                      data: controller.events[index],
                      onPressed: (value) {
                        Get.toNamed(
                          "${AppRoutes.guest}/${AppRoutes.events}/${value.id}",
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
