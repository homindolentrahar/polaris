import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polaris/core/presentation/widgets/buttons.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/core/presentation/widgets/filters.dart';
import 'package:polaris/guest/presentation/application/search_key_page_controller.dart';
import 'package:polaris/route/app_route.dart';

class SearchKeyPage extends StatelessWidget {
  const SearchKeyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder(
          init: SearchKeyPageController(),
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const PrimaryBackButton(),
                      const SizedBox(width: 8),
                      Text(
                        "Cari Event",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(
                    bottom: 24,
                    left: 24,
                    right: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormSearchField(
                        name: "search",
                        hint: "Cari event",
                        onSubmit: (value) {
                          if (value != null && value.isNotEmpty) {
                            Get.toNamed(
                              AppRoutes.searchResult,
                              arguments: value,
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 32),
                      Text(
                        "Pencarian Terakhir",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        direction: Axis.horizontal,
                        spacing: 8,
                        runSpacing: 8,
                        children: List.generate(
                          controller.filters.length,
                          (index) => FilterEventChip(
                            data: controller.filters[index],
                            onFilterSelected: (value) {
                              Get.toNamed(
                                AppRoutes.searchResult,
                                arguments: value.title,
                              );
                            },
                          ),
                        ).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
