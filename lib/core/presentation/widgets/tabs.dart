import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrimaryTabBar extends StatelessWidget {
  final int currentIndex;
  final bool isDense;
  final List<String> titles;
  final ValueChanged<int> onTabChanged;

  const PrimaryTabBar({
    super.key,
    required this.currentIndex,
    this.isDense = false,
    required this.titles,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          AnimatedSlide(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 300),
            offset: Offset(1.0 * currentIndex, 0),
            child: FractionallySizedBox(
              widthFactor: 1 / titles.length,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
            ),
          ),
          Row(
            children: List.generate(
              titles.length,
              (index) => Expanded(
                child: GestureDetector(
                  onTap: () {
                    onTabChanged(index);
                  },
                  child: Container(
                    padding: isDense
                        ? const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          )
                        : const EdgeInsets.all(12),
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Text(
                      titles[index],
                      style: index == currentIndex
                          ? Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontSize: isDense ? 12 : 14,
                              )
                          : Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: Theme.of(context).colorScheme.tertiary,
                                fontSize: isDense ? 12 : 14,
                              ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PrimaryStepBar extends StatelessWidget {
  final int currentIndex;
  final bool isDense;
  final List<String> titles;
  final ValueChanged<int> onTabChanged;

  const PrimaryStepBar({
    super.key,
    required this.currentIndex,
    this.isDense = false,
    required this.titles,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          AnimatedSlide(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 300),
            offset: Offset(1.0 * currentIndex, 0),
            child: FractionallySizedBox(
              widthFactor: 1 / titles.length,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Row(
            children: List.generate(
              titles.length,
              (index) => Expanded(
                child: GestureDetector(
                  onTap: () {
                    onTabChanged(index);
                  },
                  child: Container(
                    padding: isDense
                        ? const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          )
                        : const EdgeInsets.all(12),
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onSurface,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            (index + 1).toString(),
                            style: Get.textTheme.headlineSmall?.copyWith(
                              color: Get.theme.colorScheme.surface,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          titles[index],
                          style: index == currentIndex
                              ? Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                    fontSize: isDense ? 12 : 14,
                                  )
                              : Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    fontSize: isDense ? 12 : 14,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
