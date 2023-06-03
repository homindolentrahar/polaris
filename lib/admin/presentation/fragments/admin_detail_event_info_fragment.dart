import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polaris/admin/presentation/application/admin_detail_event_page_controller.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/core/presentation/widgets/maps.dart';

class AdminDetailEventInfoFragment extends StatelessWidget {
  const AdminDetailEventInfoFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<AdminDetailEventPageController>(),
        builder: (controller) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Deskripsi",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface),
                ),
                const SizedBox(height: 8),
                const ShowMoreText(
                  value:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                ),
                const SizedBox(height: 16),
                Text(
                  "Tempat",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface),
                ),
                const SizedBox(height: 8),
                const MapVenueInfo(),
                const SizedBox(height: 16),
                PrimarySubtitle(
                  subtitle: "Tipe Tiket",
                  fontSize: 16,
                  trailing: Text(
                    "3 tipe",
                    style: Get.textTheme.headlineSmall
                        ?.copyWith(color: Get.theme.colorScheme.onSurface),
                  ),
                ),
                const SizedBox(height: 8),
                EventTicketSelector(
                  currentIndex: controller.ticketTypeIndex,
                  initialAmount: controller.ticketAmount,
                  tickets: const [],
                  onAmountChanged: controller.onAmountChanged,
                  onTabChanged: controller.onTicketTypeChanged,
                ),
                const SizedBox(height: 16),
                const PrimarySubtitle(
                  subtitle: "Metode Pembayaran",
                  fontSize: 16,
                ),
                const SizedBox(height: 8),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  itemBuilder: (ctx, index) => PaymentTypeItem(
                    data: controller.payments[index],
                  ),
                ),
                const SizedBox(height: 16),
                const PrimarySubtitle(
                  subtitle: "Narahubung",
                  fontSize: 16,
                ),
                const SizedBox(height: 8),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  itemBuilder: (ctx, index) => ContactOrganizerItem(
                    imageUrl:
                        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
                    title: "Jane Doe",
                    subtitle: "Contact Person",
                    onCall: () {},
                  ),
                ),
              ],
            ),
          );
        });
  }
}
