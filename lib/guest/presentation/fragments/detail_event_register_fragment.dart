import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:polaris/core/presentation/widgets/fields.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/guest/presentation/applications/detail_event_register_controller.dart';

class DetailEventRegisterFragment extends StatelessWidget {
  const DetailEventRegisterFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: GetBuilder(
        init: DetailEventRegisterController(),
        builder: (controller) {
          return FormBuilder(
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
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                    Text(
                      "${controller.tickets.length} tipe",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                EventTicketSelector(
                  amount: controller.ticketAmount,
                  currentIndex: controller.tabIndex,
                  tickets: controller.tickets,
                  onTabChanged: (index) {
                    controller.onTabChanged(index);
                  },
                  onDecreased: controller.decreaseAmount,
                  onIncreased: controller.increaseAmount,
                  onAmountChanged: (value) {
                    controller.onAmountChanged(value);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
