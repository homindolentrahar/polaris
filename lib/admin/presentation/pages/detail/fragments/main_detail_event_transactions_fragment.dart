import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polaris/admin/presentation/pages/detail/main_detail_event_controller.dart';
import 'package:polaris/admin/presentation/widgets/transactions_item.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/core/presentation/widgets/filters.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/core/presentation/widgets/sheets.dart';

class MainDetailEventTransactionsFragment extends StatelessWidget {
  const MainDetailEventTransactionsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainDetailEventController>(
      builder: (controller) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormSearchField(
                name: "search",
                hint: "Cari transaksi",
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
                subtitle: "Hasil Terkini",
                trailing: Text(
                  "${controller.transactions.length} event",
                  style: Get.textTheme.headlineSmall?.copyWith(
                    color: Get.theme.colorScheme.onSurface,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: controller.transactions.length,
                separatorBuilder: (ctx, index) => const SizedBox(height: 16),
                itemBuilder: (ctx, index) => TransactionsItem(
                  data: controller.transactions[index],
                  onPressed: (value) {
                    Get.bottomSheet(
                      DetailTransactionSheet(
                        data: controller.transactions[index],
                      ),
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
