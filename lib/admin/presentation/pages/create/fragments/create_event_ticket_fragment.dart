import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/admin/presentation/pages/create/create_event_controller.dart';
import 'package:polaris/core/presentation/widgets/buttons.dart';
import 'package:polaris/core/presentation/widgets/items.dart';

class CreateEventTicketFragment extends StatelessWidget {
  const CreateEventTicketFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateEventController>(
      builder: (controller) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.event?.tickets.length ?? 0,
                itemBuilder: (ctx, index) => TicketTypeItem(
                  data: controller.event?.tickets[index],
                ),
                separatorBuilder: (ctx, index) => const SizedBox(height: 16),
              ),
              const SizedBox(height: 16),
              PrimaryDottedButton(
                icon: Icon(
                  Iconsax.add,
                  color: Get.theme.colorScheme.tertiary,
                  size: 16,
                ),
                title: "Tambah Tipe Tiket",
                onPressed: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
