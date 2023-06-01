import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polaris/auth/presentation/widgets/auth_image_banner.dart';
import 'package:polaris/core/presentation/application/app_controller.dart';
import 'package:polaris/core/presentation/widgets/buttons.dart';
import 'package:polaris/core/util/constants/app_constants.dart';
import 'package:polaris/gen/assets.gen.dart';
import 'package:polaris/route/app_route.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            AuthImageBanner(
              asset: Assets.images.landing,
              height: 360,
              withBackButton: false,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Selamat Datang!",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Cari dan temukan event yang kamu inginkan, tanpa perlu buat akun!",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                  ),
                  const SizedBox(height: 48),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PrimaryButton(
                        title: "Cari Event",
                        onPressed: () async {
                          await Get.find<AppController>()
                              .saveAppMode(AppMode.guest);

                          Get.offAllNamed(AppRoutes.guest);
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "atau",
                        style: Get.textTheme.titleSmall?.copyWith(
                          color: Get.theme.colorScheme.onBackground,
                        ),
                      ),
                      const SizedBox(height: 16),
                      PrimaryTextButton(
                        title: "Kelola Event",
                        onPressed: () async {
                          // Get.toNamed(AppRoutes.login);
                          await Get.find<AppController>()
                              .saveAppMode(AppMode.admin);

                          Get.offAllNamed(AppRoutes.admin);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
