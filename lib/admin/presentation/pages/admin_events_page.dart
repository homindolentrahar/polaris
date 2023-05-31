import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polaris/admin/presentation/application/admin_search_page_controller.dart';
import 'package:polaris/admin/presentation/widgets/admin_event_item.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/core/presentation/widgets/filters.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/route/app_route.dart';

class AdminEventsPage extends StatelessWidget {
  const AdminEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(title: "Semua Event"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
            bottom: 16,
          ),
          child: GetBuilder(
            init: AdminSearchPageController(),
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
                  FilterEventSelector(
                    models: controller.filters,
                    onFilterSelected: (filter) {},
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Hasil Pencarian",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                      Text(
                        "34 event",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 8,
                      itemBuilder: (ctx, index) => AdminEventItem(
                        onPressed: () {
                          Get.toNamed(
                            "${AppRoutes.adminEvents}/1",
                            arguments: 0,
                          );
                        },
                      ),
                      separatorBuilder: (ctx, index) =>
                          const SizedBox(height: 16),
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
