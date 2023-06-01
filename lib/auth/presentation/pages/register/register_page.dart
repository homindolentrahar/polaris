import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:polaris/auth/presentation/pages/register/register_page_controller.dart';
import 'package:polaris/auth/presentation/widgets/auth_image_banner.dart';
import 'package:polaris/auth/presentation/widgets/auth_texts.dart';
import 'package:polaris/core/presentation/widgets/buttons.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/gen/assets.gen.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: GetBuilder<RegisterPageController>(
            init: RegisterPageController(),
            builder: (controller) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthImageBanner(asset: Assets.images.register),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 32,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AuthTitleText(text: "Daftar Akun"),
                        const SizedBox(height: 8),
                        const AuthSubtitleText(
                          text:
                              "Ingin kelola eventmu dengan mudah? Ayo daftar sekarang!",
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
                              const SizedBox(height: 16),
                              const FormPasswordField(
                                name: "password",
                                hint: "Kata Sandi",
                              ),
                              const SizedBox(height: 16),
                              const FormPasswordField(
                                name: "repeat_password",
                                hint: "Ulangi Kata Sandi",
                              ),
                              const SizedBox(height: 32),
                              PrimaryButton(
                                title: "Daftar",
                                onPressed: () {
                                  controller.register();
                                },
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
