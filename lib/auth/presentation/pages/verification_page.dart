import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polaris/auth/presentation/applications/verification_page_controller.dart';
import 'package:polaris/auth/presentation/widgets/auth_image_banner.dart';
import 'package:polaris/core/presentation/widgets/buttons.dart';
import 'package:polaris/gen/assets.gen.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: GetBuilder(
              init: VerificationPageController(),
              builder: (controller) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthImageBanner(
                      asset: Assets.images.emailVerification,
                      withBackButton: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 32,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Verifikasi Email",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface),
                          ),
                          const SizedBox(height: 8),
                          RichText(
                            text: TextSpan(
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                              children: [
                                const TextSpan(
                                  text:
                                      "Verifikasi dengan membuka link dalam email yang telah kami kirimkan ke ",
                                ),
                                TextSpan(
                                  text: Get.arguments ?? "example@mail.com",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),
                          PrimaryButton(
                            title: "Cek Email",
                            onPressed: () {
                              controller.checkEmail();
                            },
                          ),
                          const SizedBox(height: 32),
                          Align(
                            alignment: Alignment.center,
                            child: PrimaryTextButton(
                              title: "Lewati Verifikasi",
                              onPressed: () {
                                controller.skipVerification();
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
