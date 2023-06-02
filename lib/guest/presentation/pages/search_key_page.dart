import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/core/presentation/widgets/filters.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/guest/presentation/applications/search_key_page_controller.dart';
import 'package:polaris/route/app_route.dart';

class SearchKeyPage extends StatelessWidget {
  const SearchKeyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppBar(title: "Cari Event"),
      body: SafeArea(
        child: GetBuilder(
          init: SearchKeyPageController(),
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                              arguments: {
                                'title': "Hasil Pencarian",
                                'value': value,
                              },
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 32),
                      const PrimarySubtitle(subtitle: "Pencarian terakhir"),
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
                                arguments: {
                                  'title': "Hasil Pencarian",
                                  'value': value.title,
                                },
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
