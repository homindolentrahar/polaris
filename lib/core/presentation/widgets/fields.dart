import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:polaris/core/domain/model/contact_model.dart';
import 'package:polaris/core/presentation/application/form_password_field_controller.dart';
import 'package:polaris/core/presentation/widgets/buttons.dart';
import 'package:polaris/core/presentation/widgets/sheets.dart';
import 'package:polaris/gen/assets.gen.dart';

enum SexType {
  male,
  female,
}

class FormTextField extends StatelessWidget {
  final bool enabled;
  final TextEditingController? controller;
  final String? initialValue;
  final String name;
  final String hint;
  final int lines;
  final bool isObscure;
  final bool isRequired;
  final TextInputType keyboardType;
  final TextInputAction action;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final ValueChanged<String>? onSubmitted;
  final List<String? Function(String?)>? validators;

  const FormTextField({
    super.key,
    this.enabled = true,
    this.controller,
    this.initialValue,
    required this.name,
    required this.hint,
    this.lines = 1,
    this.keyboardType = TextInputType.text,
    this.action = TextInputAction.done,
    this.isObscure = false,
    this.isRequired = true,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.onSubmitted,
    this.validators,
  });

  factory FormTextField.underline({
    bool enabled = true,
    TextEditingController? controller,
    String? initialValue,
    required String name,
    required String hint,
    int lines = 1,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction action = TextInputAction.done,
    bool isObscure = false,
    bool isRequired = true,
    Widget? prefixIcon,
    Widget? suffixIcon,
    VoidCallback? onTap,
    ValueChanged<String>? onSubmitted,
    List<String? Function(String?)>? validators,
  }) =>
      FormTextField(
        enabled: enabled,
        controller: controller,
        initialValue: initialValue,
        name: name,
        hint: hint,
      );

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
        name: name,
        initialValue: initialValue,
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
                initialValue: field.value,
                controller: controller,
                readOnly: !enabled,
                onTap: onTap,
                onChanged: field.didChange,
                onFieldSubmitted: onSubmitted,
                obscureText: isObscure,
                keyboardType: keyboardType,
                textInputAction: action,
                maxLines: lines,
                minLines: lines,
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
                    prefixIcon: prefixIcon,
                    suffixIcon: suffixIcon,
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
                              color:
                                  Theme.of(context).colorScheme.outlineVariant,
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

class FormAmountField extends StatelessWidget {
  final int initialAmount;
  final String name;
  final String hint;
  final int maxAmount;
  final VoidCallback onDecreased;
  final VoidCallback onIncreased;
  final ValueChanged<int> onAmountChanged;

  const FormAmountField({
    super.key,
    required this.initialAmount,
    required this.name,
    required this.hint,
    required this.maxAmount,
    required this.onDecreased,
    required this.onIncreased,
    required this.onAmountChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        PrimaryIconButton(
          icon: Icon(
            Iconsax.minus,
            size: 16,
            color: Get.theme.colorScheme.tertiary,
          ),
          color: Get.theme.colorScheme.onSurface,
          onPressed: initialAmount <= 0 ? null : onDecreased,
        ),
        const SizedBox(width: 8),
        FormBuilderField(
          name: name,
          initialValue: initialAmount.toString(),
          onChanged: (value) {
            if (value != null) {
              final intValue = int.parse(value);
              onAmountChanged(intValue > maxAmount ? maxAmount : intValue);
            }
          },
          builder: (field) {
            return GestureDetector(
              onTap: () async {
                final int? amount = await Get.bottomSheet(
                  Container(
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Get.theme.colorScheme.surface,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Jumlah Tiket",
                          style: Get.textTheme.titleMedium?.copyWith(
                            color: Get.theme.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 16),
                        FormTextField(
                          initialValue: initialAmount.toString(),
                          name: "",
                          hint: hint,
                          keyboardType: TextInputType.number,
                          onSubmitted: (value) {
                            Get.back(result: int.parse(value));
                          },
                        ),
                      ],
                    ),
                  ),
                );

                if (amount != null) {
                  field.didChange(amount.toString());
                }
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Get.theme.colorScheme.background,
                  border: Border.all(
                    color: Get.theme.colorScheme.outlineVariant,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  initialAmount == 0 ? hint : initialAmount.toString(),
                  style: initialAmount == 0
                      ? Get.textTheme.bodySmall?.copyWith(
                          color: Get.theme.colorScheme.tertiary,
                        )
                      : Get.textTheme.titleSmall?.copyWith(
                          color: Get.theme.colorScheme.onSurface,
                        ),
                ),
              ),
            );
          },
        ),
        const SizedBox(width: 8),
        PrimaryIconButton(
          icon: Icon(
            Iconsax.add,
            size: 16,
            color: Get.theme.colorScheme.tertiary,
          ),
          color: Get.theme.colorScheme.onSurface,
          onPressed: initialAmount >= maxAmount ? null : onIncreased,
        ),
      ],
    );
  }
}

class FormSexField extends StatelessWidget {
  final String name;
  final String hint;
  final SexType? initialData;
  final ValueChanged<SexType> onSexChanged;

  const FormSexField({
    super.key,
    required this.name,
    required this.hint,
    required this.initialData,
    required this.onSexChanged,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController()
      ..text = initialData == SexType.male
          ? "Laki-laki"
          : initialData == SexType.female
              ? "Perempuan"
              : "";

    return FormTextField(
      controller: controller,
      name: name,
      hint: hint,
      keyboardType: TextInputType.number,
      enabled: false,
      suffixIcon: Icon(
        Iconsax.arrow_down_1,
        color: Theme.of(context).colorScheme.tertiary,
        size: 16,
      ),
      onTap: () async {
        final SexType? result = await Get.bottomSheet(
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jenis Kelamin",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface),
                ),
                const SizedBox(height: 16),
                FormBuilderRadioGroup<SexType>(
                  initialValue: initialData,
                  name: "",
                  onChanged: (value) {
                    Get.back(result: value);
                  },
                  orientation: OptionsOrientation.vertical,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    enabledBorder: InputBorder.none,
                  ),
                  options: [
                    FormBuilderFieldOption(
                      value: SexType.male,
                      child: Text(
                        "Laki-laki",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                    ),
                    FormBuilderFieldOption(
                      value: SexType.female,
                      child: Text(
                        "Perempuan",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );

        if (result != null) {
          onSexChanged(result);
        }
      },
    );
  }
}

class FormLinkField extends StatelessWidget {
  final String value;
  final ValueChanged<String> onLinkCopied;

  const FormLinkField({
    super.key,
    required this.value,
    required this.onLinkCopied,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: Get.theme.colorScheme.background,
              border: Border.all(color: Get.theme.colorScheme.outline),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  Iconsax.link_2,
                  color: Get.theme.colorScheme.onSurface,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    value,
                    overflow: TextOverflow.ellipsis,
                    style: Get.textTheme.headlineSmall?.copyWith(
                      color: Get.theme.colorScheme.onSurface,
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        PrimaryIconButton(
          color: Get.theme.primaryColor.withOpacity(0.15),
          icon: Icon(
            Iconsax.copy5,
            color: Get.theme.primaryColor,
            size: 20,
          ),
          onPressed: () => onLinkCopied(value),
        ),
      ],
    );
  }
}

class FormDateTimeField extends StatelessWidget {
  final bool enabled;
  final DateTime? initialValue;
  final String name;
  final String hint;
  final Widget? suffixIcon;
  final InputType type;
  final ValueChanged<DateTime?>? onDateChanged;

  const FormDateTimeField({
    super.key,
    this.enabled = true,
    this.initialValue,
    required this.name,
    required this.hint,
    this.suffixIcon,
    required this.type,
    this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<DateTime>(
        name: name,
        initialValue: initialValue,
        onChanged: onDateChanged,
        builder: (field) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormBuilderDateTimePicker(
                inputType: type,
                initialValue: field.value,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                format: type == InputType.date
                    ? DateFormat("dd MMMM yyyy", 'id_ID')
                    : DateFormat("HH:mm"),
                name: "",
                onChanged: field.didChange,
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
                  contentPadding: const EdgeInsets.all(20),
                  suffixIcon: suffixIcon ??
                      (type == InputType.date
                          ? Icon(
                              Iconsax.calendar5,
                              color: Get.theme.colorScheme.tertiary,
                              size: 16,
                            )
                          : Icon(
                              Iconsax.calendar5,
                              color: Get.theme.colorScheme.tertiary,
                              size: 16,
                            )),
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

class FormImageField extends StatelessWidget {
  final String name;
  final String hint;
  final Widget? icon;
  final Uint8List? initialData;
  final ValueChanged<Uint8List?> onImagePicked;
  final VoidCallback onImageRemoved;

  const FormImageField({
    super.key,
    required this.name,
    required this.hint,
    this.icon,
    required this.initialData,
    required this.onImagePicked,
    required this.onImageRemoved,
  });

  Widget buildField({required ValueChanged<Uint8List?> onImagePicked}) {
    return Material(
      color: Get.theme.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          Get.bottomSheet(
            PickImageSheet(
              showRemove: false,
              onImagePicked: onImagePicked,
              onImageRemoved: onImageRemoved,
            ),
          );
        },
        borderRadius: BorderRadius.circular(8),
        splashColor: Get.theme.colorScheme.onSurface.withOpacity(0.045),
        highlightColor: Get.theme.colorScheme.onSurface.withOpacity(0.09),
        child: DottedBorder(
          borderType: BorderType.RRect,
          padding: const EdgeInsets.all(32),
          radius: const Radius.circular(8),
          strokeCap: StrokeCap.round,
          dashPattern: const [8, 8, 8, 8],
          color: Get.theme.colorScheme.tertiary.withOpacity(0.45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              icon ??
                  Icon(
                    Iconsax.gallery,
                    color: Get.theme.colorScheme.tertiary,
                    size: 20,
                  ),
              const SizedBox(height: 8),
              Text(
                hint,
                textAlign: TextAlign.center,
                style: Get.theme.textTheme.titleSmall
                    ?.copyWith(color: Get.theme.colorScheme.tertiary),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDisplay({
    required Uint8List data,
    required ValueChanged<Uint8List?> onImagePicked,
  }) {
    return GestureDetector(
      onTap: () {
        Get.bottomSheet(
          PickImageSheet(
            showRemove: true,
            onImagePicked: onImagePicked,
            onImageRemoved: onImageRemoved,
          ),
        );
      },
      child: Container(
        width: Get.width,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: MemoryImage(data),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<Uint8List>(
      name: name,
      initialValue: initialData,
      onChanged: (value) {
        onImagePicked(value);
      },
      builder: (field) {
        return initialData != null
            ? buildDisplay(
                data: initialData!,
                onImagePicked: (value) {
                  field.didChange(value);
                },
              )
            : buildField(
                onImagePicked: (value) {
                  field.didChange(value);
                },
              );
      },
    );
  }
}

class FormAddContactPersonField extends StatelessWidget {
  final String name;
  final VoidCallback onAddPressed;
  final ValueChanged<List<ContactModel>?> onContactsChanged;

  const FormAddContactPersonField({
    super.key,
    required this.name,
    required this.onAddPressed,
    required this.onContactsChanged,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<List<ContactModel>>(
      name: name,
      onChanged: onContactsChanged,
      builder: (field) {
        return InkWell(
          onTap: onAddPressed,
          borderRadius: BorderRadius.circular(8),
          splashColor: Get.theme.colorScheme.onSurface.withOpacity(0.025),
          highlightColor: Get.theme.colorScheme.onSurface.withOpacity(0.05),
          child: DottedBorder(
            borderType: BorderType.RRect,
            padding: const EdgeInsets.all(16),
            radius: const Radius.circular(8),
            strokeCap: StrokeCap.round,
            dashPattern: const [8, 8, 8, 8],
            color: Get.theme.colorScheme.tertiary.withOpacity(0.45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Iconsax.add,
                  color: Get.theme.colorScheme.tertiary,
                  size: 20,
                ),
                Text(
                  "Tambah Narahubung",
                  style: Get.textTheme.titleSmall?.copyWith(
                    color: Get.theme.colorScheme.tertiary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
