import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:polaris/auth/presentation/pages/forgot_password/forgot_password_page_controller.dart';
import 'package:polaris/auth/presentation/widgets/auth_image_banner.dart';
import 'package:polaris/auth/presentation/widgets/auth_texts.dart';
import 'package:polaris/core/presentation/widgets/buttons.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/core/util/helper/string_helper.dart';
import 'package:polaris/gen/assets.gen.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: GetBuilder<ForgotPasswordPageController>(
            init: ForgotPasswordPageController(),
            builder: (controller) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthImageBanner(asset: Assets.images.forgotPassword),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 32,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AuthTitleText(text: "Lupa Kata Sandi"),
                        const SizedBox(height: 8),
                        const AuthSubtitleText(
                          text:
                              "Tautan ubah kata sandi akan dikirimkan melalui alamat email yang telah kamu daftarkan",
                        ),
                        const SizedBox(height: 32),
                        FormBuilder(
                          key: controller.formKey,
                          child: Column(
                            children: [
                              FormTextField(
                                name: "email",
                                hint: "Alamat Email",
                                validators: [
                                  FormBuilderValidators.email(
                                    errorText: "Format email tidak sesuai!",
                                  ),
                                ],
                              ),
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
                                child: AuthFooterText(
                                  text: "Belum menerima email?  ",
                                  isTimerActive: controller.tick > 0,
                                  actionText: controller.tick > 0
                                      ? StringHelper.formatTimer(
                                          controller.tick,
                                        )
                                      : "Kirim Ulang",
                                  onActionPressed: () {
                                    controller.submit();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
