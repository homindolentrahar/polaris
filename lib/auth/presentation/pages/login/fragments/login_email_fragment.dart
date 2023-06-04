import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:polaris/auth/presentation/pages/login/fragments/login_email_controller.dart';
import 'package:polaris/auth/presentation/widgets/auth_texts.dart';
import 'package:polaris/core/presentation/widgets/buttons.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/route/app_route.dart';

class LoginEmailFragment extends StatelessWidget {
  const LoginEmailFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 32),
      child: GetBuilder<LoginEmailController>(
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthTitleText(text: "Lama Tak Jumpa!"),
              const SizedBox(height: 8),
              const AuthSubtitleText(text: "Kelola event-mu dengan mudah"),
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: PrimaryTextButton(
                        title: "Lupa Kata Sandi?",
                        onPressed: () {
                          Get.toNamed(AppRoutes.forgotPassword);
                        },
                      ),
                    ),
                    const SizedBox(height: 32),
                    PrimaryButton(
                      title: "Masuk",
                      onPressed: () {
                        controller.login();
                      },
                    ),
                    const SizedBox(height: 32),
                    AuthFooterText(
                      text: "Belum punya akun?  ",
                      actionText: "Daftar",
                      onActionPressed: () {
                        Get.toNamed(AppRoutes.register);
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
