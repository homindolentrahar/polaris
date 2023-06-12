import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polaris/admin/presentation/pages/detail/main_detail_event_controller.dart';
import 'package:polaris/admin/presentation/widgets/analytics_bar.dart';
import 'package:polaris/admin/presentation/widgets/stats_item.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/core/presentation/widgets/filters.dart';
import 'package:polaris/core/presentation/widgets/items.dart';

class MainDetailEventAnalyticsFragment extends StatelessWidget {
  const MainDetailEventAnalyticsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainDetailEventController>(
      builder: (controller) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnalyticsBar(
                data: controller.totalAnalytics,
              ),
              const SizedBox(height: 32),
              FormSearchField(
                name: "search",
                hint: "Cari Event",
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
              const PrimarySubtitle(subtitle: "Rincian"),
              const SizedBox(height: 16),
              ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.events.length,
                separatorBuilder: (ctx, index) => const SizedBox(height: 16),
                itemBuilder: (ctx, index) => StatsItem(
                  data: controller.events[index],
                  analytic: controller.monthlyAnalytics.firstWhere(
                    (element) => element.eventId == controller.events[index].id,
                  ),
                  onPressed: (value) {},
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
