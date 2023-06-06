import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polaris/admin/presentation/pages/main/fragments/analytics_controller.dart';
import 'package:polaris/admin/presentation/widgets/analytics_bar.dart';
import 'package:polaris/admin/presentation/widgets/stats_item.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/route/app_route.dart';

class AnalyticsFragment extends StatelessWidget {
  const AnalyticsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnalyticsController>(
      builder: (controller) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Analitik",
                    style: Get.textTheme.headlineMedium
                        ?.copyWith(color: Get.theme.colorScheme.onSurface),
                  ),
                  DateSelector(
                    title: "Tahun Ini",
                    onDateSelected: (value) {},
                  ),
                ],
              ),
              const SizedBox(height: 32),
              AnalyticsBar(data: controller.totalAnalytics),
              const SizedBox(height: 32),
              FormSearchField(
                name: "search",
                hint: "Cari Event",
                onSubmit: (value) {},
              ),
              const SizedBox(height: 16),
              // FilterSelector(
              //   filters: const [],
              //   onFilterSelected: (filter) {},
              //   onSortSelected: () {},
              // ),
              const SizedBox(height: 32),
              PrimarySubtitle(
                subtitle: "Hasil Terkini",
                trailing: Text(
                  "${controller.events.length} event",
                  style: Get.textTheme.headlineSmall?.copyWith(
                    color: Get.theme.colorScheme.onSurface,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.events.length,
                separatorBuilder: (ctx, index) => const SizedBox(height: 16),
                itemBuilder: (ctx, index) => StatsItem(
                  analytic: controller.monthlyAnalytics.firstWhere(
                    (element) => element.eventId == controller.events[index].id,
                  ),
                  data: controller.events[index],
                  onPressed: (value) {
                    Get.toNamed(
                      "${AppRoutes.admin}/${AppRoutes.events}/${value.id}",
                      arguments: 1,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
