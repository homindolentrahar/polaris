import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polaris/admin/domain/models/beranda_summary_model.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/core/util/helper/list_helper.dart';

class BerandaSummary extends StatelessWidget {
  final String uniqueUrl;
  final List<HomeAnalyticsSummary> items;
  final ValueChanged<String> onUrlCopied;

  const BerandaSummary({
    super.key,
    required this.uniqueUrl,
    required this.items,
    required this.onUrlCopied,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Get.theme.colorScheme.outline),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
            runSpacing: 16,
            children:
                ListHelper.getGrouppedList<HomeAnalyticsSummary>(list: items)
                    .map(
                      (list) => Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: list
                            .map(
                              (e) => Expanded(
                                child: _BerandaSummaryItem(data: e),
                              ),
                            )
                            .toList(),
                      ),
                    )
                    .toList(),
          ),
          const SizedBox(height: 32),
          FormLinkField(
            value: uniqueUrl,
            onLinkCopied: (value) {
              onUrlCopied(value);
            },
          ),
        ],
      ),
    );
  }
}

class _BerandaSummaryItem extends StatelessWidget {
  final HomeAnalyticsSummary data;

  const _BerandaSummaryItem({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconContainer(
          icon: Icon(
            data.icon,
            color: Get.theme.colorScheme.onBackground,
            size: 16,
          ),
        ),
        const SizedBox(width: 8),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.value,
              style: Get.textTheme.headlineLarge?.copyWith(
                color: Get.theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              data.title,
              style: Get.textTheme.titleSmall?.copyWith(
                color: Get.theme.colorScheme.onBackground,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
