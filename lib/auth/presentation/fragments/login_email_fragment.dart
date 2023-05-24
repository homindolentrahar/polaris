import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:polaris/auth/presentation/application/login_email_controller.dart';
import 'package:polaris/core/presentation/widgets/buttons.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/route/app_route.dart';

class LoginEmailFragment extends StatelessWidget {
  const LoginEmailFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginEmailController>(
      init: LoginEmailController(),
      builder: (controller) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Lama Tak Jumpa!",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              const SizedBox(height: 8),
              Text(
                "Kelola event-mu dengan mudah",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.tertiary),
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
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: Theme.of(context).colorScheme.tertiary),
                        children: [
                          const TextSpan(text: "Belum punya akun?  "),
                          TextSpan(
                            text: "Daftar",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(AppRoutes.register);
                              },
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
