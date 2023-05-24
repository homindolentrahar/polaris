import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:polaris/auth/presentation/application/login_phone_controller.dart';
import 'package:polaris/core/presentation/widgets/buttons.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/route/app_route.dart';

class LoginPhoneFragment extends StatelessWidget {
  const LoginPhoneFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: LoginPhoneController(),
        builder: (controller) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lama Tak Jumpa!",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface),
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
                      const FormPhoneField(
                        name: "phone",
                        hint: "Nomor Handphone",
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
                                  color:
                                      Theme.of(context).colorScheme.tertiary),
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
                )
              ],
            ),
          );
        });
  }
}
