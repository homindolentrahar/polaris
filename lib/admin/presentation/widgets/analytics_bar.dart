import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/core/domain/model/analytic.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/core/util/helper/string_helper.dart';
import 'package:polaris/gen/colors.gen.dart';

class AnalyticsBar extends StatelessWidget {
  final Map<DateTime, List<Analytic>> data;

  const AnalyticsBar({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final int totalClicks = data.entries
        .map(
          (e) => e.value.fold(
            0,
            (previousValue, element) => previousValue += element.clicks,
          ),
        )
        .toList()
        .fold(
          0,
          (previousValue, element) => previousValue += element,
        );
    final int totalViews = data.entries
        .map(
          (e) => e.value.fold(
            0,
            (previousValue, element) => previousValue += element.views,
          ),
        )
        .toList()
        .fold(
          0,
          (previousValue, element) => previousValue += element,
        );

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
                      final int monthlyClicks =
                          data.values.toList()[value.toInt()].fold(
                                0,
                                (previousValue, element) =>
                                    previousValue += element.clicks,
                              );
                      final int monthlyViews =
                          data.values.toList()[value.toInt()].fold(
                                0,
                                (previousValue, element) =>
                                    previousValue += element.views,
                              );

                      return SideTitleWidget(
                        axisSide: meta.axisSide,
                        space: 8,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              StringHelper.formatMonth(
                                data.keys
                                    .toList()
                                    .reversed
                                    .toList()[value.toInt()],
                              ),
                              style: Get.textTheme.titleLarge?.copyWith(
                                color: Get.theme.colorScheme.onBackground,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              "${((monthlyClicks / monthlyViews) * 100).toStringAsFixed(1)}%",
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
              barGroups: List.generate(
                data.length,
                (index) => BarChartGroupData(
                  x: index,
                  barsSpace: 4,
                  barRods: [
                    BarChartRodData(
                      toY: min(
                        data.values.toList()[index].fold(
                                0.0,
                                (previousValue, element) =>
                                    previousValue += element.views) /
                            10,
                        100,
                      ),
                      width: 16,
                      color: ColorName.view,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                    ),
                    BarChartRodData(
                      toY: min(
                        data.values.toList()[index].fold(
                                0.0,
                                (previousValue, element) =>
                                    previousValue += element.clicks) /
                            10,
                        100,
                      ),
                      width: 16,
                      color: ColorName.click,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                    )
                  ],
                ),
              ).toList(),
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
                value: totalViews.toString(),
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
                value: totalClicks.toString(),
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
                value:
                    "${((totalClicks / totalViews) * 100).toStringAsFixed(1)}%",
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
