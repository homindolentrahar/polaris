import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:polaris/auth/presentation/application/otp_page_controller.dart';
import 'package:polaris/auth/presentation/widgets/auth_image_banner.dart';
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
          child: GetBuilder(
              init: OtpPageController(),
              builder: (controller) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthImageBanner(asset: Assets.images.otp),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Verifikasi OTP",
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
                                      "Masukkan 5 digit kode OTP yang telah dikirimkan ke ",
                                ),
                                TextSpan(
                                  text: StringHelper.obscurePhone(
                                    Get.arguments ?? "0857112233",
                                  ),
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .tertiary),
                                      children: [
                                        const TextSpan(
                                          text: "Belum menerima kode?  ",
                                        ),
                                        controller.tick > 0
                                            ? TextSpan(
                                                text: StringHelper.formatTimer(
                                                  controller.tick,
                                                ),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall
                                                    ?.copyWith(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onSurface,
                                                    ),
                                              )
                                            : TextSpan(
                                                text: "Kirim Ulang",
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        controller.submit();
                                                      },
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall
                                                    ?.copyWith(
                                                        color: Theme.of(context)
                                                            .primaryColor),
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
              }),
        ),
      ),
    );
  }
}
