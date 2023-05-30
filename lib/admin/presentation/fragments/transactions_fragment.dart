import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polaris/admin/presentation/application/transactions_controller.dart';
import 'package:polaris/admin/presentation/widgets/transactions_item.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/core/presentation/widgets/filters.dart';
import 'package:polaris/core/presentation/widgets/items.dart';

class TransactionsFragment extends StatelessWidget {
  const TransactionsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: TransactionsController(),
      builder: (controller) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
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
                subtitle: "Hasil Terkini",
                trailing: Text(
                  "34 event",
                  style: Get.textTheme.headlineSmall?.copyWith(
                    color: Get.theme.colorScheme.onSurface,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 480,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  separatorBuilder: (ctx, index) => const SizedBox(height: 16),
                  itemBuilder: (ctx, index) => TransactionsItem(
                    type: TransactionType.income,
                    onPressed: () {},
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
