import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/core/domain/model/general.dart';
import 'package:polaris/core/domain/share.dart';
import 'package:polaris/core/presentation/widgets/buttons.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/core/util/helper/image_picker_helper.dart';
import 'package:polaris/core/util/helper/snackbar_helper.dart';

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
    Rx<Uint8List?> profileImage = Rx(null);

    return Obx(
      () => Container(
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
            const SizedBox(height: 32),
            Align(
              alignment: Alignment.center,
              child: Material(
                color: Get.theme.colorScheme.surface,
                child: InkWell(
                  borderRadius: BorderRadius.circular(360),
                  onTap: () {
                    Get.bottomSheet(
                      PickImageSheet(
                        showRemove: profileImage.value != null,
                        onImagePicked: (value) {
                          profileImage.value = value;
                          Get.back();
                        },
                        onImageRemoved: () {
                          profileImage.value = null;
                          Get.back();
                        },
                      ),
                    );
                  },
                  child: profileImage.value != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(360),
                          child: Image.memory(
                            profileImage.value!,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        )
                      : DottedBorder(
                          dashPattern: const [4, 4, 4, 4],
                          color: Get.theme.colorScheme.tertiary,
                          borderType: BorderType.Circle,
                          padding: EdgeInsets.zero,
                          child: SizedBox(
                            width: 80,
                            height: 80,
                            child: Icon(
                              Iconsax.user,
                              color: Get.theme.colorScheme.tertiary,
                            ),
                          ),
                        ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            FormTextField(
              name: "nama",
              hint: "Nama Lengkap",
              action: TextInputAction.next,
              prefixIcon: Icon(
                Iconsax.user,
                color: Get.theme.colorScheme.tertiary,
                size: 16,
              ),
            ),
            const SizedBox(height: 16),
            FormTextField(
              name: "phone",
              hint: "Nomor Handphone",
              keyboardType: TextInputType.number,
              prefixIcon: Icon(
                Iconsax.call,
                color: Get.theme.colorScheme.tertiary,
                size: 16,
              ),
            ),
            const SizedBox(height: 32),
            PrimaryButton(
              width: Get.width,
              title: "Tambah",
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AddTicketSheet extends StatelessWidget {
  const AddTicketSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final RxList<String> benefits = RxList(
      [""],
    );

    return Container(
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tambah Tiket",
            style: Get.textTheme.headlineSmall?.copyWith(
              color: Get.theme.colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FormTextField(
                    name: "category",
                    hint: "Nama Kategori",
                    action: TextInputAction.next,
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: FormTextField(
                          name: "amount",
                          hint: "Jumlah Tiket",
                          keyboardType: TextInputType.number,
                          action: TextInputAction.next,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: FormTextField(
                          name: "price",
                          hint: "Harga",
                          keyboardType: TextInputType.number,
                          action: TextInputAction.next,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Keuntungan",
                    style: Get.textTheme.headlineSmall?.copyWith(
                      color: Get.theme.colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () => Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: List.generate(
                        benefits.length,
                        (index) => Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: FormTextField(
                                name: "benefit_$index",
                                hint: "Keuntungan #${index + 1}",
                              ),
                            ),
                            const SizedBox(width: 16),
                            PrimaryIconButton(
                              color:
                                  Get.theme.colorScheme.error.withOpacity(0.15),
                              icon: Icon(
                                Iconsax.trash,
                                color: Get.theme.colorScheme.error,
                                size: 20,
                              ),
                              onPressed: () {
                                benefits.removeAt(index);
                              },
                            ),
                          ],
                        ),
                      ).toList(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  PrimaryDottedButton(
                    icon: Icon(
                      Iconsax.add,
                      color: Get.theme.colorScheme.tertiary,
                      size: 16,
                    ),
                    title: "Tambah Keuntungan",
                    onPressed: () {
                      benefits.add("");
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          PrimaryButton(
            title: "Tambah",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class AddPaymentMethodSheet extends StatelessWidget {
  const AddPaymentMethodSheet({super.key});

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
            "Tambah Metode Pembayaran",
            style: Get.textTheme.headlineSmall?.copyWith(
              color: Get.theme.colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 32),
          const FormTextField(
            name: "name",
            hint: "Nama Metode",
            action: TextInputAction.next,
          ),
          const SizedBox(height: 16),
          const FormTextField(
            name: "value",
            hint: "Nomor Rekening / Handphone",
            keyboardType: TextInputType.number,
            action: TextInputAction.next,
          ),
          const SizedBox(height: 16),
          FormTextField(
            name: "pci",
            hint: "Nama PIC",
            keyboardType: TextInputType.number,
            action: TextInputAction.next,
            prefixIcon: Icon(
              Iconsax.user,
              color: Get.theme.colorScheme.tertiary,
              size: 16,
            ),
          ),
          const SizedBox(height: 32),
          PrimaryButton(
            title: "Tambah",
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}

class ShareEventSheet extends StatelessWidget {
  final List<Share> items;
  final ValueChanged<Share> onItemSelected;

  const ShareEventSheet({
    super.key,
    required this.items,
    required this.onItemSelected,
  });

  Widget _buildShareItem(Share data) {
    return GestureDetector(
      onTap: () {
        onItemSelected(data);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconContainer(icon: data.icon),
          const SizedBox(height: 8),
          Text(
            data.title,
            style: Get.textTheme.titleSmall?.copyWith(
              color: Get.theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

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
            "Bagikan Event",
            style: Get.textTheme.headlineSmall?.copyWith(
              color: Get.theme.colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 24,
            runSpacing: 16,
            children: items.map((e) => _buildShareItem(e)).toList(),
          ),
        ],
      ),
    );
  }
}

class GenerateUrlSheet extends StatelessWidget {
  final List<Share> items;
  final ValueChanged<Share> onItemSelected;

  const GenerateUrlSheet({
    super.key,
    required this.items,
    required this.onItemSelected,
  });

  Widget _buildShareItem(Share data) {
    return GestureDetector(
      onTap: () {
        onItemSelected(data);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconContainer(icon: data.icon),
          const SizedBox(height: 8),
          Text(
            data.title,
            style: Get.textTheme.titleSmall?.copyWith(
              color: Get.theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

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
            "Generate URL",
            style: Get.textTheme.headlineSmall?.copyWith(
              color: Get.theme.colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 32),
          FormLinkField(
            value: "https://polaris.event/himatep/events/matsuri_uii",
            onLinkCopied: (value) {
              SnackbarHelper.showSnackbar(
                title: "URL Disalin",
                message: value,
              );
            },
          ),
          const SizedBox(height: 32),
          Text(
            "Bagikan",
            style: Get.textTheme.headlineSmall?.copyWith(
              color: Get.theme.colorScheme.onSurface,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: Get.width,
            child: Wrap(
              spacing: 24,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.horizontal,
              children: items.map((e) => _buildShareItem(e)).toList(),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
