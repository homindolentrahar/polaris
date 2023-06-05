import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polaris/admin/presentation/pages/main/fragments/transactions_controller.dart';
import 'package:polaris/admin/presentation/widgets/transactions_item.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/core/presentation/widgets/filters.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/route/app_route.dart';

class TransactionsFragment extends StatelessWidget {
  const TransactionsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionsController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Transaksi",
                    style: Get.textTheme.headlineMedium
                        ?.copyWith(color: Get.theme.colorScheme.onSurface),
                  ),
                  DateSelector(
                    title: "Bulan Ini",
                    onDateSelected: (value) {},
                  ),
                ],
              ),
              const SizedBox(height: 32),
              FormSearchField(
                name: "search",
                hint: "Cari Event",
                onSubmit: (value) {},
              ),
              const SizedBox(height: 16),
              FilterEventSelector(
                models: controller.filters,
                onFilterSelected: (filter) {},
              ),
              const SizedBox(height: 32),
              PrimarySubtitle(
                subtitle: "Hasil",
                trailing: Text(
                  "${controller.transactions.length} transaksi",
                  style: Get.textTheme.headlineSmall?.copyWith(
                    color: Get.theme.colorScheme.onSurface,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.transactions.length,
                  separatorBuilder: (ctx, index) => const SizedBox(height: 16),
                  itemBuilder: (ctx, index) => TransactionsItem(
                    data: controller.transactions[index],
                    onPressed: (value) {
                      Get.toNamed(
                        "${AppRoutes.admin}/${AppRoutes.events}/${value.eventId}",
                        arguments: 2,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
