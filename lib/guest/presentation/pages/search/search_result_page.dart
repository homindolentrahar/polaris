import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/guest/presentation/pages/search/search_result_controller.dart';
import 'package:polaris/guest/presentation/widgets/event_item.dart';
import 'package:polaris/route/app_route.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: Get.arguments['title'] ?? "Hasil Pencarian",
      ),
      body: SafeArea(
        child: GetBuilder<SearchResultController>(
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.only(
                bottom: 24,
                left: 24,
                right: 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormSearchField(
                    name: "search",
                    hint: "Cari event",
                    initialValue: Get.arguments['value'],
                    onSubmit: (value) {
                      controller.getAllEvents();
                    },
                  ),
                  const SizedBox(height: 16),
                  // FilterSelector(
                  //   filters: const [],
                  //   onFilterSelected: (filter) {},
                  //   onSortSelected: () {},
                  // ),
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
                      itemBuilder: (ctx, index) => EventItem(
                        data: controller.events[index],
                        onPressed: (value) {
                          Get.toNamed(
                            "${AppRoutes.guest}/${AppRoutes.events}/${value.id}",
                          );
                        },
                      ),
                      separatorBuilder: (ctx, index) =>
                          const SizedBox(height: 16),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
