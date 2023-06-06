import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/core/domain/model/general.dart';
import 'package:polaris/core/presentation/widgets/sheets.dart';

class FilterSelector extends StatelessWidget {
  final FilterSortData? selectedFilter;
  final FilterSortData? selectedSort;
  final List<FilterSortData> sorts;
  final List<FilterSortData> filters;
  final String sortTitle;
  final String? sortSubmitText;
  final ValueChanged<FilterSortData> onFilterSelected;
  final ValueChanged<FilterSortData> onSortSelected;
  final VoidCallback onSortCleared;

  const FilterSelector({
    super.key,
    this.selectedFilter,
    this.selectedSort,
    required this.sorts,
    required this.filters,
    required this.sortTitle,
    this.sortSubmitText,
    required this.onFilterSelected,
    required this.onSortSelected,
    required this.onSortCleared,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 32,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SortButton(
            isSelected: selectedSort != null,
            onPressed: () async {
              final String? sort = await Get.bottomSheet(
                SortSheet(
                  title: "Urutkan Event",
                  submitText: sortSubmitText,
                  selectedSort: selectedSort,
                  sorts: sorts,
                  onSortCleared: () {
                    onSortCleared();
                  },
                ),
              );

              if (sort != null) {
                onSortSelected(
                  sorts.firstWhere((element) => element.value == sort),
                );
              }
            },
          ),
          const SizedBox(width: 8),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (ctx, index) => FilterChip(
                isSelected: filters[index].id == selectedFilter?.id,
                data: filters[index],
                onFilterSelected: (value) {
                  onFilterSelected(value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FilterChip extends StatelessWidget {
  final bool isSelected;
  final FilterSortData data;
  final ValueChanged<FilterSortData> onFilterSelected;

  const FilterChip({
    super.key,
    required this.isSelected,
    required this.data,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: Get.theme.colorScheme.outline,
          width: 1,
        ),
      ),
      color: isSelected
          ? Get.theme.colorScheme.primary
          : Get.theme.colorScheme.surface,
      child: InkWell(
        onTap: () => onFilterSelected(data),
        borderRadius: BorderRadius.circular(8),
        splashColor: Get.theme.colorScheme.onSurface.withOpacity(0.05),
        highlightColor: Get.theme.colorScheme.onSurface.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            data.title,
            style: Get.textTheme.bodyMedium?.copyWith(
              color: isSelected
                  ? Get.theme.colorScheme.onPrimary
                  : Get.theme.colorScheme.tertiary,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

class SortButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onPressed;

  const SortButton({
    super.key,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: Get.theme.colorScheme.outlineVariant,
          width: isSelected ? 0 : 1,
        ),
      ),
      color: isSelected
          ? Get.theme.primaryColor
          : Get.theme.colorScheme.background,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        splashColor: Get.theme.colorScheme.onSurface.withOpacity(0.05),
        highlightColor: Get.theme.colorScheme.onSurface.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Iconsax.setting_4,
                color: isSelected
                    ? Get.theme.colorScheme.onPrimary
                    : Get.theme.colorScheme.tertiary,
                size: 16,
              ),
              const SizedBox(width: 8),
              Text(
                "Urutkan",
                style: Get.textTheme.titleMedium?.copyWith(
                  color: isSelected
                      ? Get.theme.colorScheme.onPrimary
                      : Get.theme.colorScheme.tertiary,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
