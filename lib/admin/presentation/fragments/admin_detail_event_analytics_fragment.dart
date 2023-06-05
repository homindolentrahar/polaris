import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polaris/admin/presentation/application/admin_detail_event_page_controller.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/core/presentation/widgets/filters.dart';
import 'package:polaris/core/presentation/widgets/items.dart';

class AdminDetailEventAnalyticsFragment extends StatelessWidget {
  const AdminDetailEventAnalyticsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<AdminDetailEventPageController>(),
      builder: (controller) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AnalyticsBar(
              //   data: controller.analytics,
              // ),
              const SizedBox(height: 32),
              FormSearchField(
                name: "search",
                hint: "Cari Event",
                onSubmit: (value) {},
              ),
              const SizedBox(height: 16),
              FilterEventSelector(
                models: controller.analyticsFilters,
                onFilterSelected: (filter) {},
              ),
              const SizedBox(height: 32),
              const PrimarySubtitle(subtitle: "Rincian"),
              const SizedBox(height: 16),
              ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                separatorBuilder: (ctx, index) => const SizedBox(height: 16),
                itemBuilder: (ctx, index) => Container(),
              )
            ],
          ),
        );
      },
    );
  }
}
