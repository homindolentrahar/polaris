import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/core/domain/model/general.dart';
import 'package:polaris/core/presentation/widgets/buttons.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/core/util/helper/image_picker_helper.dart';

class SortSheet extends StatelessWidget {
  final String title;
  final FilterSortData? selectedSort;
  final List<FilterSortData> sorts;
  final String? submitText;
  final VoidCallback onSortCleared;

  const SortSheet({
    super.key,
    required this.title,
    this.selectedSort,
    required this.sorts,
    this.submitText,
    required this.onSortCleared,
  });

  @override
  Widget build(BuildContext context) {
    final Rx<String?> sort = Rx<String?>(selectedSort?.value);

    return Container(
      padding: const EdgeInsets.all(24),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Get.textTheme.headlineSmall?.copyWith(
                  color: Get.theme.colorScheme.onSurface,
                ),
              ),
              Visibility(
                visible: selectedSort != null,
                child: PrimaryTextButton(
                  title: "Reset",
                  onPressed: () {
                    Get.back();
                    onSortCleared();
                  },
                  titleColor: Get.theme.colorScheme.error,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          FormTextField(
            name: "urutan",
            hint: "Urutan",
            initialValue: "Menaik",
            enabled: false,
            suffixIcon: Icon(
              Iconsax.sort,
              color: Get.theme.colorScheme.onSurface,
              size: 20,
            ),
            onTap: () {
              Get.dialog(
                AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  content: Container(
                    decoration: BoxDecoration(
                      color: Get.theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: FormBuilderRadioGroup(
                      initialValue: "ascending",
                      name: "urutan",
                      orientation: OptionsOrientation.vertical,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                      onChanged: (value) {
                        Get.back();
                      },
                      options: [
                        FormBuilderFieldOption(
                          value: "ascending",
                          child: Text(
                            "Menaik",
                            style: Get.textTheme.titleMedium?.copyWith(
                              color: Get.theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                        FormBuilderFieldOption(
                          value: "descending",
                          child: Text(
                            "Menurun",
                            style: Get.textTheme.titleMedium?.copyWith(
                              color: Get.theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Obx(
                () => FormBuilderRadioGroup<String>(
                  name: 'sort',
                  initialValue: sort.value,
                  activeColor: Get.theme.primaryColor,
                  orientation: OptionsOrientation.vertical,
                  wrapSpacing: 8,
                  wrapRunSpacing: 8,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  onChanged: (value) {
                    sort.value = value;
                  },
                  options: List.generate(
                    sorts.length,
                    (index) => FormBuilderFieldOption(
                      value: sorts[index].value,
                      child: Text(
                        sorts[index].title,
                        style: Get.textTheme.titleMedium?.copyWith(
                          color: Get.theme.colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          PrimaryButton(
            title: submitText ?? "Tetapkan",
            onPressed: () {
              Get.back(result: sort.value);
            },
          ),
        ],
      ),
    );
  }
}

class PickImageSheet extends StatelessWidget {
  final bool showRemove;
  final VoidCallback onImageRemoved;
  final ValueChanged<Uint8List?> onImagePicked;

  const PickImageSheet({
    super.key,
    this.showRemove = false,
    required this.onImageRemoved,
    required this.onImagePicked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(8),
          topLeft: Radius.circular(8),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            color: Get.theme.colorScheme.surface,
            child: InkWell(
              onTap: () async {
                final result = await ImagePickerHelper.instance.openCamera();
                onImagePicked(await result?.readAsBytes());
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Iconsax.camera,
                      color: Get.theme.colorScheme.onSurface,
                      size: 16,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      "Kamera",
                      style: Get.textTheme.headlineSmall?.copyWith(
                        color: Get.theme.colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Material(
            color: Get.theme.colorScheme.surface,
            child: InkWell(
              onTap: () async {
                final result = await ImagePickerHelper.instance.openGallery();
                onImagePicked(await result?.readAsBytes());
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Iconsax.gallery,
                      color: Get.theme.colorScheme.onSurface,
                      size: 16,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      "Galeri",
                      style: Get.textTheme.headlineSmall?.copyWith(
                        color: Get.theme.colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: showRemove,
            child: Material(
              color: Get.theme.colorScheme.surface,
              child: InkWell(
                onTap: onImageRemoved,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.trash,
                        color: Get.theme.colorScheme.error,
                        size: 16,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        "Hapus Gambar",
                        style: Get.textTheme.headlineSmall?.copyWith(
                          color: Get.theme.colorScheme.error,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddPicSheet extends StatelessWidget {
  const AddPicSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
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
            "Tambah Narahubung",
            style: Get.textTheme.headlineSmall?.copyWith(
              color: Get.theme.colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
