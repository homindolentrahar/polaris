import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/core/presentation/widgets/items.dart';

class AdminDetailEventTransactionsFragment extends StatelessWidget {
  const AdminDetailEventTransactionsFragment({super.key});

  @override
  Widget build(BuildContext context) {
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
          ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: 10,
            separatorBuilder: (ctx, index) => const SizedBox(height: 16),
            itemBuilder: (ctx, index) => Container(),
          ),
        ],
      ),
    );
  }
}
