import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/admin/domain/models/analytics_model.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/gen/colors.gen.dart';

class AnalyticsBar extends StatelessWidget {
  final List<AnalyticsModel> data;

  const AnalyticsBar({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 160,
          child: BarChart(
            BarChartData(
              maxY: 100,
              gridData: FlGridData(show: false),
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 64,
                    getTitlesWidget: (value, meta) {
                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        space: 8,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              data[value.toInt()].title,
                              style: Get.textTheme.titleLarge?.copyWith(
                                color: Get.theme.colorScheme.onBackground,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              "${data[value.toInt()].ctr.toStringAsFixed(0)}%",
                              style: Get.textTheme.headlineSmall
                                  ?.copyWith(color: ColorName.ctr),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              barGroups: data
                  .asMap()
                  .entries
                  .map(
                    (entry) => BarChartGroupData(
                      x: entry.key,
                      barsSpace: 4,
                      barRods: [
                        BarChartRodData(
                          toY: entry.value.views,
                          width: 16,
                          color: ColorName.view,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4),
                          ),
                        ),
                        BarChartRodData(
                          toY: entry.value.clicks,
                          width: 16,
                          color: ColorName.click,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4),
                          ),
                        )
                      ],
                    ),
                  )
                  .toList(),
              backgroundColor: Get.theme.colorScheme.surface,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Get.theme.colorScheme.outline),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _AnalyticsItem(
                icon: const Icon(
                  Iconsax.eye4,
                  color: ColorName.view,
                  size: 16,
                ),
                backgroundColor: ColorName.view.withOpacity(0.15),
                value: "560",
                title: "Tampil",
              ),
              const SizedBox(width: 16),
              _AnalyticsItem(
                icon: const Icon(
                  Iconsax.mouse5,
                  color: ColorName.click,
                  size: 16,
                ),
                backgroundColor: ColorName.click.withOpacity(0.15),
                value: "320",
                title: "Klik",
              ),
              const SizedBox(width: 16),
              _AnalyticsItem(
                icon: const Icon(
                  Iconsax.electricity5,
                  color: ColorName.ctr,
                  size: 16,
                ),
                backgroundColor: ColorName.ctr.withOpacity(0.15),
                value: "56%",
                title: "CTR",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AnalyticsItem extends StatelessWidget {
  final Widget icon;
  final String value;
  final String title;
  final Color backgroundColor;

  const _AnalyticsItem({
    required this.icon,
    required this.backgroundColor,
    required this.value,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconContainer(
          icon: icon,
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.all(8),
          radius: 8,
        ),
        const SizedBox(width: 8),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: Get.textTheme.headlineSmall?.copyWith(
                color: Get.theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: Get.textTheme.titleSmall?.copyWith(
                color: Get.theme.colorScheme.onBackground,
              ),
            )
          ],
        ),
      ],
    );
  }
}
