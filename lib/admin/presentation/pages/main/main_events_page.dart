import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polaris/admin/presentation/pages/main/main_events_controller.dart';
import 'package:polaris/admin/presentation/widgets/main_event_item.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/core/presentation/widgets/filters.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/route/app_route.dart';

class MainEventsPage extends StatelessWidget {
  const MainEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(title: "Semua Event"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
            bottom: 24,
          ),
          child: GetBuilder<MainEventsController>(
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormSearchField(
                    name: "search",
                    hint: "Cari event",
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
                  PrimarySubtitle(
                    subtitle: "Hasil pencarian",
                    trailing: Text(
                      "${controller.events.length} event",
                      style: Get.textTheme.headlineSmall?.copyWith(
                        color: Get.theme.colorScheme.onSurface,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.events.length,
                      separatorBuilder: (ctx, index) =>
                          const SizedBox(height: 16),
                      itemBuilder: (ctx, index) => MainEventItem(
                        data: controller.events[index],
                        onPressed: (value) {
                          Get.toNamed(
                            "${AppRoutes.admin}/${AppRoutes.events}/${value.id}",
                            arguments: 0,
                          );
                        },
                      ),
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
