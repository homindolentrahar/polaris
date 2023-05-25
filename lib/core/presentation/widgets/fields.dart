import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:polaris/core/presentation/application/form_password_field_controller.dart';
import 'package:polaris/gen/assets.gen.dart';

class FormTextField extends StatelessWidget {
  final String name;
  final String hint;
  final bool isObscure;
  final bool isRequired;
  final TextInputType keyboardType;
  final TextInputAction action;
  final Widget? suffixIcon;
  final List<String? Function(String?)>? validators;

  const FormTextField({
    super.key,
    required this.name,
    required this.hint,
    this.keyboardType = TextInputType.text,
    this.action = TextInputAction.done,
    this.isObscure = false,
    this.isRequired = true,
    this.suffixIcon,
    this.validators,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
        name: name,
        validator: FormBuilderValidators.compose(
          [
            FormBuilderValidators.required(
              errorText: "Field tidak boleh kosong!",
            ),
            ...?validators,
          ],
        ),
        builder: (field) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                onChanged: field.didChange,
                obscureText: isObscure,
                keyboardType: keyboardType,
                textInputAction: action,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
                decoration: InputDecoration(
                    errorStyle: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: Theme.of(context).colorScheme.error),
                    hintText: hint,
                    hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.tertiary),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.background,
                    contentPadding: const EdgeInsets.all(20),
                    suffixIcon: suffixIcon,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 1,
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 1.5,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 1,
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 1.5,
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    )),
              ),
              Visibility(
                visible: field.hasError,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        field.errorText ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontSize: 12,
                                color: Theme.of(context).colorScheme.error),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }
}

class FormPasswordField extends StatelessWidget {
  final String name;
  final String hint;
  final TextInputAction action;
  final Widget? suffixIcon;

  const FormPasswordField({
    super.key,
    required this.name,
    required this.hint,
    this.action = TextInputAction.done,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormPasswordFieldController>(
      init: FormPasswordFieldController(),
      builder: (controller) {
        return FormBuilderField<String>(
          name: name,
          validator: FormBuilderValidators.compose(
            [
              FormBuilderValidators.required(
                errorText: "Field tidak boleh kosong!",
              ),
              FormBuilderValidators.match(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$',
              ),
            ],
          ),
          builder: (field) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  onChanged: field.didChange,
                  obscureText: controller.isObscure,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: action,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface),
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.tertiary),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.background,
                    contentPadding: const EdgeInsets.all(20),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.toggleObscureText();
                      },
                      child: Icon(
                        controller.isObscure
                            ? Iconsax.eye4
                            : Iconsax.eye_slash5,
                        color: Theme.of(context).colorScheme.tertiary,
                        size: 20,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 1,
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 1.5,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 1,
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 1.5,
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                Visibility(
                  visible: field.hasError,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .error
                              .withOpacity(0.25),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Format Kata Sandi tidak sesuai",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    color: Theme.of(context).colorScheme.error,
                                    fontSize: 12,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Wrap(
                              direction: Axis.vertical,
                              spacing: 4,
                              children: [
                                Text(
                                  "•  Minimal 8 karakter",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                          fontSize: 12,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .error),
                                ),
                                Text(
                                  "•  Mengandung huruf kecil dan besar",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                          fontSize: 12,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .error),
                                ),
                                Text(
                                  "•  Mengandung angka",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                          fontSize: 12,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .error),
                                ),
                              ],
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
        );
      },
    );
  }
}

class FormPhoneField extends StatelessWidget {
  final String name;
  final String hint;
  final TextInputAction action;

  const FormPhoneField({
    super.key,
    required this.name,
    required this.hint,
    this.action = TextInputAction.done,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      name: name,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: "Field tidak boleh kosong!"),
        FormBuilderValidators.match(
          r'^0[0-9]+',
          errorText: "Format nomor handphone tidak sesuai!",
        )
      ]),
      builder: (field) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              onChanged: field.didChange,
              keyboardType: TextInputType.phone,
              textInputAction: action,
              maxLength: 13,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
              decoration: InputDecoration(
                  counterText: "",
                  errorStyle: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Theme.of(context).colorScheme.error),
                  hintText: hint,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Theme.of(context).colorScheme.tertiary),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.background,
                  contentPadding: const EdgeInsets.all(20),
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 64,
                  ),
                  prefixIcon: Container(
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSurface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Assets.icons.icFlag,
                          width: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "+62",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.surface,
                                fontSize: 12,
                              ),
                        ),
                      ],
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 1,
                      color: Theme.of(context).colorScheme.outlineVariant,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 1.5,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 1,
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      width: 1.5,
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  )),
            ),
            Visibility(
              visible: field.hasError,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).colorScheme.error.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Format Nomor Handphone tidak sesuai",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.error,
                                fontSize: 12,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Contoh: 085711223344",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                  fontSize: 12,
                                  color: Theme.of(context).colorScheme.error),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

class FormOtpField extends StatelessWidget {
  final String name;
  final int length;
  final TextInputAction action;

  const FormOtpField({
    super.key,
    required this.name,
    this.length = 4,
    this.action = TextInputAction.done,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      name: name,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: "Field tidak boleh kosong!"),
        FormBuilderValidators.numeric(errorText: "Field harus berisi angka!"),
        FormBuilderValidators.minLength(length,
            errorText: "Field harus berisi 4 digit angka!"),
      ]),
      builder: (field) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PinCodeTextField(
              appContext: context,
              length: length,
              onChanged: field.didChange,
              keyboardType: TextInputType.number,
              textInputAction: action,
              enableActiveFill: true,
              textStyle: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(8),
                fieldWidth: 56,
                fieldHeight: 56,
                borderWidth: 1,
                activeFillColor: Theme.of(context).colorScheme.background,
                inactiveFillColor: Theme.of(context).colorScheme.background,
                selectedFillColor: Theme.of(context).colorScheme.background,
                activeColor: Theme.of(context).primaryColor,
                selectedColor: Theme.of(context).primaryColor,
                inactiveColor: Theme.of(context).colorScheme.outlineVariant,
                errorBorderColor: Theme.of(context).colorScheme.error,
              ),
            ),
            Visibility(
              visible: field.hasError,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      field.errorText ?? "",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.error),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class FormSearchField extends StatelessWidget {
  final String name;
  final String hint;
  final String? initialValue;
  final bool enabled;
  final Widget? prefixIcon;
  final VoidCallback? onTap;
  final ValueChanged<String?> onSubmit;

  const FormSearchField({
    super.key,
    required this.name,
    required this.hint,
    this.initialValue,
    this.enabled = true,
    this.prefixIcon,
    this.onTap,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      onTap: onTap,
      onSubmitted: onSubmit,
      readOnly: !enabled,
      initialValue: initialValue,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      style: Theme.of(context)
          .textTheme
          .titleMedium
          ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
      decoration: InputDecoration(
        errorStyle: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: Theme.of(context).colorScheme.error),
        hintText: hint,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Theme.of(context).colorScheme.tertiary),
        filled: true,
        fillColor: Theme.of(context).colorScheme.background,
        contentPadding: const EdgeInsets.all(16),
        prefixIcon: prefixIcon ??
            Icon(
              Iconsax.search_normal_1,
              color: Theme.of(context).colorScheme.tertiary,
              size: 16,
            ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        ),
        focusedBorder: enabled
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 1.5,
                  color: Theme.of(context).primaryColor,
                ),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 1,
                  color: Theme.of(context).colorScheme.outlineVariant,
                ),
              ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1.5,
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
