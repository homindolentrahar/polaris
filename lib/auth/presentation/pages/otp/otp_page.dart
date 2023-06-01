import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:polaris/auth/presentation/pages/otp/otp_page_controller.dart';
import 'package:polaris/auth/presentation/widgets/auth_image_banner.dart';
import 'package:polaris/auth/presentation/widgets/auth_texts.dart';
import 'package:polaris/core/presentation/widgets/buttons.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/core/util/helper/string_helper.dart';
import 'package:polaris/gen/assets.gen.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: GetBuilder<OtpPageController>(
            init: OtpPageController(),
            builder: (controller) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthImageBanner(asset: Assets.images.otp),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 32,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AuthTitleText(text: "Verifikasi OTP"),
                        const SizedBox(height: 8),
                        RichText(
                          text: TextSpan(
                            style: Get.textTheme.titleMedium?.copyWith(
                              color: Get.theme.colorScheme.tertiary,
                            ),
                            children: [
                              const TextSpan(
                                text:
                                    "Masukkan 5 digit kode OTP yang telah dikirimkan ke ",
                              ),
                              TextSpan(
                                text: StringHelper.obscurePhone(
                                  controller.arguments,
                                ),
                                style: Get.textTheme.headlineSmall?.copyWith(
                                  color: Get.theme.colorScheme.onSurface,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        FormBuilder(
                          key: controller.formKey,
                          child: Column(
                            children: [
                              const FormOtpField(name: "otp"),
                              const SizedBox(height: 32),
                              PrimaryButton(
                                title: "Kirim",
                                onPressed: controller.tick > 0
                                    ? null
                                    : () {
                                        controller.submit();
                                      },
                              ),
                              const SizedBox(height: 32),
                              Visibility(
                                visible: controller.isResubmit,
                                child: RichText(
                                  text: TextSpan(
                                    style: Get.textTheme.titleMedium?.copyWith(
                                      color: Get.theme.colorScheme.tertiary,
                                    ),
                                    children: [
                                      const TextSpan(
                                        text: "Belum menerima kode?  ",
                                      ),
                                      controller.tick > 0
                                          ? TextSpan(
                                              text: StringHelper.formatTimer(
                                                controller.tick,
                                              ),
                                              style: Get.textTheme.headlineSmall
                                                  ?.copyWith(
                                                color: Get.theme.colorScheme
                                                    .onSurface,
                                              ),
                                            )
                                          : TextSpan(
                                              text: "Kirim Ulang",
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  controller.submit();
                                                },
                                              style: Get.textTheme.headlineSmall
                                                  ?.copyWith(
                                                color: Get.theme.primaryColor,
                                              ),
                                            ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
