import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/admin/presentation/pages/create/create_event_controller.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/core/presentation/widgets/maps.dart';
import 'package:polaris/core/presentation/widgets/sheets.dart';
import 'package:polaris/core/util/helper/log_helper.dart';

class CreateEventInfoFragment extends StatelessWidget {
  const CreateEventInfoFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateEventController>(
      builder: (controller) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: Get.width,
            child: FormBuilder(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormImageField(
                    initialData: controller.selectedImage,
                    name: "image",
                    hint: "Unggah Foto Event",
                    onImagePicked: (value) {
                      if (value != null) {
                        controller.onImagePicked(value);
                        Get.back();
                      }
                    },
                    onImageRemoved: () {
                      controller.onImageRemoved();
                      LogHelper.instance
                          .error("Image: ${controller.selectedImage}");
                      Get.back();
                    },
                  ),
                  const SizedBox(height: 16),
                  const FormTextField(
                    name: "name",
                    hint: "Nama Event",
                  ),
                  const SizedBox(height: 16),
                  const FormTextField(
                    name: "description",
                    hint: "Deskripsi Event",
                    lines: 3,
                  ),
                  const SizedBox(height: 16),
                  FormTextField(
                    name: "capacity",
                    hint: "Kapasitas",
                    keyboardType: TextInputType.number,
                    suffixIcon: Icon(
                      Iconsax.profile_2user5,
                      color: Get.theme.colorScheme.tertiary,
                      size: 16,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: FormDateTimeField(
                          type: InputType.date,
                          name: "date",
                          hint: "Tanggal",
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: FormDateTimeField(
                          type: InputType.time,
                          name: "time",
                          hint: "Waktu",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const MapPicker(name: "destination"),
                  const SizedBox(height: 16),
                  FormAddContactPersonField(
                    name: "contacts",
                    onAddPressed: () {
                      Get.bottomSheet(const AddPicSheet());
                    },
                    onContactsChanged: (value) {},
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
