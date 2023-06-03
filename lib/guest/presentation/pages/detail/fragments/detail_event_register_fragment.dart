import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/guest/presentation/pages/detail/detail_event_controller.dart';

class DetailEventRegisterFragment extends StatelessWidget {
  const DetailEventRegisterFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailEventController>(
      builder: (controller) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: FormBuilder(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormTextField(
                  name: "name",
                  hint: "Nama Lengkap",
                ),
                const SizedBox(height: 16),
                const FormTextField(
                  name: "domicile",
                  hint: "Domisili",
                  lines: 3,
                ),
                const SizedBox(height: 16),
                const FormTextField(
                  name: "email",
                  hint: "Alamat Email",
                ),
                const SizedBox(height: 16),
                const FormPhoneField(
                  name: "phone",
                  hint: "Nomor Handphone",
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Expanded(
                      child: FormTextField(
                        name: "age",
                        hint: "Umur",
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: FormSexField(
                        name: "sex",
                        hint: "Jenis Kelamin",
                        initialData: controller.sex,
                        onSexChanged: controller.onSexChanged,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tipe Tiket",
                      style: Get.textTheme.titleMedium?.copyWith(
                        color: Get.theme.colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      "${controller.event?.tickets.length} tipe",
                      style: Get.textTheme.headlineSmall?.copyWith(
                        color: Get.theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                EventTicketSelector(
                  initialAmount: controller.ticketAmount,
                  currentIndex: controller.ticketTypeIndex,
                  tickets: controller.event?.tickets ?? [],
                  onTabChanged: (index) {
                    controller.onTicketTypeChanged(index);
                  },
                  onAmountChanged: (value) {
                    controller.onAmountChanged(value);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
