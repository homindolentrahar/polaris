import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:polaris/core/domain/model/general.dart';
import 'package:polaris/core/presentation/widgets/buttons.dart';

class SortSheet extends StatelessWidget {
  final String title;
  final FilterSortData? selectedSort;
  final List<FilterSortData> sorts;
  final String? submitText;
  final VoidCallback onSortCleared;

  const SortSheet({
    super.key,
    required this.title,
    this.selectedSort,
    required this.sorts,
    this.submitText,
    required this.onSortCleared,
  });

  @override
  Widget build(BuildContext context) {
    final Rx<String?> sort = Rx<String?>(selectedSort?.value);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Get.textTheme.headlineSmall?.copyWith(
                  color: Get.theme.colorScheme.onSurface,
                ),
              ),
              Visibility(
                visible: selectedSort != null,
                child: PrimaryTextButton(
                  title: "Reset",
                  onPressed: () {
                    Get.back();
                    onSortCleared();
                  },
                  titleColor: Get.theme.colorScheme.error,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Obx(
            () => FormBuilderRadioGroup<String>(
              name: 'sort',
              initialValue: sort.value,
              activeColor: Get.theme.primaryColor,
              orientation: OptionsOrientation.vertical,
              wrapSpacing: 8,
              wrapRunSpacing: 8,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
              onChanged: (value) {
                sort.value = value;
              },
              options: List.generate(
                sorts.length,
                (index) => FormBuilderFieldOption(
                  value: sorts[index].value,
                  child: Text(
                    sorts[index].title,
                    style: Get.textTheme.titleMedium?.copyWith(
                      color: Get.theme.colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          PrimaryButton(
            title: submitText ?? "Tetapkan",
            onPressed: () {
              Get.back(result: sort.value);
            },
          ),
        ],
      ),
    );
  }
}
