import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/core/presentation/widgets/filters.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/guest/presentation/applications/search_result_page_controller.dart';
import 'package:polaris/guest/presentation/widgets/event_item.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: Get.arguments['title'] ?? "Hasil Pencarian",
      ),
      body: SafeArea(
        child: GetBuilder(
          init: SearchResultPageController(),
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
                    onSubmit: (value) {},
                  ),
                  const SizedBox(height: 16),
                  FilterEventSelector(
                    models: controller.filters,
                    onFilterSelected: (filter) {},
                  ),
                  const SizedBox(height: 32),
                  PrimarySubtitle(
                    subtitle: "Hasil pencarian",
                    trailing: Text(
                      "34 event",
                      style: Get.textTheme.headlineSmall?.copyWith(
                        color: Get.theme.colorScheme.onSurface,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 8,
                      itemBuilder: (ctx, index) => EventItem(
                        id: index.toString(),
                        onPressed: (value) {},
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
