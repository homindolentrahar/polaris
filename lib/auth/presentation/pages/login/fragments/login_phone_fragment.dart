import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:polaris/auth/presentation/pages/login/fragments/login_phone_controller.dart';
import 'package:polaris/auth/presentation/widgets/auth_texts.dart';
import 'package:polaris/core/presentation/widgets/buttons.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/route/app_route.dart';

class LoginPhoneFragment extends StatelessWidget {
  const LoginPhoneFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 32),
      child: GetBuilder<LoginPhoneController>(
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
                    AuthFooterText(
                      text: "Belum punya akun?  ",
                      actionText: "Daftar",
                      onActionPressed: () {
                        Get.toNamed(AppRoutes.register);
                      },
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
