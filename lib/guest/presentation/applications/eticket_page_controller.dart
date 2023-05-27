import 'package:get/get.dart';
import 'package:polaris/core/domain/model/detail_info_model.dart';
import 'package:polaris/core/util/helper/string_helper.dart';

class EticketPageController extends GetxController {
  final List<DetailInfoModel> infos = [
    DetailInfoModel(
      title: "ID Pesanan",
      value: "112323218490",
    ),
    DetailInfoModel(
      title: "Harga",
      value: StringHelper.formatCurrency(25000),
    ),
    DetailInfoModel(
      title: "Tanggal",
      value: StringHelper.formatDate(
          dateTime: DateTime.now(), pattern: "dd MMMM yyyy"),
    ),
    DetailInfoModel(
      title: "Waktu",
      value: StringHelper.formatTime(dateTime: DateTime.now()),
    ),
    DetailInfoModel(
      title: "Venue",
      value: "Jogja Expo Center",
    ),
    DetailInfoModel(
      title: "Seat",
      value: "-",
    ),
  ];

  List<List<DetailInfoModel>> getGrouppedInfos({int count = 2}) {
    final List<List<DetailInfoModel>> grouppedInfo = [];

    for (var i = 0; i < infos.length; i += count) {
      grouppedInfo.add(
        infos.sublist(i, i + count >= infos.length ? infos.length : i + count),
      );
    }

    return grouppedInfo;
  }
}
