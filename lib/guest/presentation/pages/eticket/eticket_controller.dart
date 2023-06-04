import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polaris/core/domain/model/detail_info_model.dart';
import 'package:polaris/core/util/helper/string_helper.dart';
import 'package:polaris/guest/data/repositories/etickets_repository.dart';
import 'package:polaris/guest/domain/models/eticket.dart';

class EticketController extends GetxController {
  final EticketsRepository repository = EticketsRepository();
  final PageController pageController = PageController();

  int carouselIndex = 0;

  List<Eticket> tickets = List.empty();

  @override
  void onInit() {
    super.onInit();

    getAllTickets();
  }

  Future<void> getAllTickets() async {
    tickets = await repository.getAllTickets();
    update();
  }

  List<List<DetailInfoModel>> getGrouppedInfos({
    int count = 2,
    required Eticket data,
  }) {
    final List<DetailInfoModel> infos = [
      DetailInfoModel(
        title: "ID Pesanan",
        value: data.orderId,
      ),
      DetailInfoModel(
        title: "Harga",
        value: StringHelper.formatCurrency(data.price),
      ),
      DetailInfoModel(
        title: "Tanggal",
        value: StringHelper.formatDate(
          dateTime: data.dateTime,
          pattern: "dd MMMM yyyy",
        ),
      ),
      DetailInfoModel(
        title: "Waktu",
        value: StringHelper.formatTime(dateTime: data.dateTime),
      ),
      DetailInfoModel(
        title: "Venue",
        value: data.venue,
      ),
      DetailInfoModel(
        title: "Seat",
        value: data.seat,
      ),
    ];
    final List<List<DetailInfoModel>> grouppedInfo = [];

    for (var i = 0; i < infos.length; i += count) {
      grouppedInfo.add(
        infos.sublist(i, i + count >= infos.length ? infos.length : i + count),
      );
    }

    return grouppedInfo;
  }

  void onCarouselChanged(int index) {
    carouselIndex = index;
    update();
  }
}
