import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polaris/core/presentation/widgets/buttons.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/core/presentation/widgets/filters.dart';
import 'package:polaris/guest/presentation/application/guest_home_page_controller.dart';
import 'package:polaris/guest/presentation/widgets/guest_event_item.dart';
import 'package:polaris/guest/presentation/widgets/location_info.dart';
import 'package:polaris/guest/presentation/widgets/popular_event_item.dart';
import 'package:polaris/route/app_route.dart';

class GuestHomePage extends StatelessWidget {
  const GuestHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(24),
          child: GetBuilder(
            init: GuestHomePageController(),
            builder: (controller) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LocationInfo(),
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
                  Text(
                    "Event Populer",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 352,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      separatorBuilder: (ctx, index) =>
                          const SizedBox(width: 16),
                      itemBuilder: (ctx, index) => const PopularEventItem(),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Terkini",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface),
                      ),
                      PrimaryTextButton(
                        title: "Lihat Semua",
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    separatorBuilder: (ctx, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (ctx, index) => const GuestEventItem(),
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
