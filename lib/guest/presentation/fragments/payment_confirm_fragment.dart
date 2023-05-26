import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/core/presentation/widgets/items.dart';
import 'package:polaris/core/util/helper/string_helper.dart';
import 'package:polaris/gen/assets.gen.dart';

class PaymentConfirmFragment extends StatelessWidget {
  const PaymentConfirmFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Get.width,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: Get.theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Get.theme.colorScheme.outline,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringHelper.formatCurrency(56000),
                  style: Get.textTheme.headlineLarge?.copyWith(
                    color: Get.theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  direction: Axis.horizontal,
                  spacing: 4,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Assets.icons.icTicket,
                          width: 20,
                          height: 20,
                          color: Get.theme.colorScheme.onBackground,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "Tiket Reguler",
                          style: Get.textTheme.titleMedium?.copyWith(
                            color: Get.theme.colorScheme.onBackground,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "•",
                      style: Get.textTheme.titleMedium?.copyWith(
                        color: Get.theme.colorScheme.onBackground,
                      ),
                    ),
                    Text(
                      "2 buah",
                      style: Get.textTheme.titleMedium?.copyWith(
                        color: Get.theme.colorScheme.onBackground,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    color: Get.theme.colorScheme.tertiary.withOpacity(0.25),
                    thickness: 1,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconContainer(
                          backgroundColor: Get.theme.colorScheme.onSurface,
                          icon: Icon(
                            Iconsax.money_recive,
                            size: 20,
                            color: Get.theme.colorScheme.surface,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "GoPay",
                              style: Get.textTheme.headlineSmall?.copyWith(
                                color: Get.theme.colorScheme.onSurface,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "085711223344",
                              style: Get.textTheme.titleMedium?.copyWith(
                                  color: Get.theme.colorScheme.onBackground),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Iconsax.user,
                          color: Get.theme.colorScheme.onSurface,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "Jonas Khanwald",
                          style: Get.textTheme.headlineSmall?.copyWith(
                            color: Get.theme.colorScheme.onSurface,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Text(
            "Data Diri",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
          const SizedBox(height: 16),
          Container(
            width: Get.width,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Get.theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Get.theme.colorScheme.outline,
                width: 1,
              ),
            ),
            child: const Wrap(
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.start,
              spacing: 8,
              children: [
                _DetailInfo(title: "Nama Lengkap", value: "Marsha Lenathea"),
                _DetailInfo(
                  title: "Domisili",
                  value:
                      "Jl. Raya Janti, Wonocatur, Kec. Banguntapan, Kabupaten Bantul, Daerah Istimewa Yogyakarta 55198",
                ),
                _DetailInfo(
                  title: "Alamat Email",
                  value: "marhsalanime@gmail.com",
                ),
                _DetailInfo(
                  title: "Nomor Handphone",
                  value: "085711223355",
                ),
                Row(
                  children: [
                    _DetailInfo(
                      title: "Umur",
                      value: "17 tahun",
                    ),
                    SizedBox(width: 32),
                    _DetailInfo(
                      title: "Jenis Kelamin",
                      value: "Perempuan",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailInfo extends StatelessWidget {
  final String title;
  final String value;

  const _DetailInfo({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Get.textTheme.titleSmall
              ?.copyWith(color: Get.theme.colorScheme.onBackground),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: Get.textTheme.headlineSmall
              ?.copyWith(color: Get.theme.colorScheme.onSurface),
        ),
      ],
    );
  }
}
