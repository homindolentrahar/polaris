import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:polaris/admin/domain/models/beranda_summary_model.dart';

class BerandaController extends GetxController {
  final List<BerandaSummaryModel> summaries = [
    BerandaSummaryModel(
      icon: Iconsax.eye4,
      title: "Total Tampil",
      value: "300",
    ),
    BerandaSummaryModel(
      icon: Iconsax.mouse5,
      title: "Total Klik",
      value: "234",
    ),
    BerandaSummaryModel(
      icon: Iconsax.electricity5,
      title: "CTR (Rata-rata)",
      value: "54%",
    ),
    BerandaSummaryModel(
      icon: Iconsax.calendar_15,
      title: "Total Event",
      value: "12",
    ),
  ];
}
