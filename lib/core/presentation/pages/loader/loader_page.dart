import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polaris/core/presentation/pages/loader/loader_page_controller.dart';

class LoaderPage extends StatelessWidget {
  const LoaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoaderPageController>(
      init: LoaderPageController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Text(
                "Polaris",
                style: Get.textTheme.headlineLarge?.copyWith(
                  color: Get.theme.colorScheme.onSurface,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
