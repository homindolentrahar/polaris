import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/admin/presentation/application/create_event_page_controller.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/core/presentation/widgets/maps.dart';

class CreateEventInfoFragment extends StatelessWidget {
  const CreateEventInfoFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.find<CreateEventPageController>(),
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
                    name: "image",
                    hint: "Unggah Foto Event",
                    onImagePicked: (value) {},
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
                    onAddPressed: () {},
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
