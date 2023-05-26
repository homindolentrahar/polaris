import 'package:flutter/material.dart';

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
