import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/core/domain/model/filter_event_model.dart';

class FilterEventSelector extends StatelessWidget {
  final List<FilterEventModel> models;
  final ValueChanged<FilterEventModel> onFilterSelected;

  const FilterEventSelector({
    super.key,
    required this.models,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 36,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FilterEventButton(
            onPressed: () {},
          ),
          const SizedBox(width: 8),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: models.length,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (ctx, index) => FilterEventChip(
                data: models[index],
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

class FilterEventChip extends StatelessWidget {
  final FilterEventModel data;
  final ValueChanged<FilterEventModel> onFilterSelected;

  const FilterEventChip({
    super.key,
    required this.data,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
          width: 1,
        ),
      ),
      color: Theme.of(context).colorScheme.surface,
      child: InkWell(
        onTap: () => onFilterSelected(data),
        borderRadius: BorderRadius.circular(8),
        splashColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.15),
        highlightColor:
            Theme.of(context).colorScheme.tertiary.withOpacity(0.25),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            data.title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Theme.of(context).colorScheme.tertiary),
          ),
        ),
      ),
    );
  }
}

class FilterEventButton extends StatelessWidget {
  final VoidCallback onPressed;

  const FilterEventButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outlineVariant,
          width: 1,
        ),
      ),
      color: Theme.of(context).colorScheme.background,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        splashColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.15),
        highlightColor:
            Theme.of(context).colorScheme.tertiary.withOpacity(0.25),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Iconsax.setting_4,
                color: Theme.of(context).colorScheme.tertiary,
                size: 16,
              ),
              const SizedBox(width: 8),
              Text(
                "Filter",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.tertiary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
