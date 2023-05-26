import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:polaris/core/domain/model/ticket_type_model.dart';

enum SexType {
  male,
  female,
}

class DetailEventRegisterController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  final tickets = [
    TicketTypeModel(
      id: "reguler",
      title: "Reguler",
      price: 56000,
      ticketsLeft: 19,
      benefits: [
        "Gantungan Kunci Eksklusif",
        "Kipas Tangan Eksklusif",
      ],
    ),
    TicketTypeModel(
      id: "silver",
      title: "Silver",
      price: 80000,
      ticketsLeft: 89,
      benefits: [
        "Gantungan Kunci Eksklusif",
        "Kipas Tangan Eksklusif",
        "1 buah Softdrink",
        "1 ticket gacha",
      ],
    ),
    TicketTypeModel(
      id: "gold",
      title: "Gold",
      price: 120000,
      ticketsLeft: 50,
      benefits: [
        "Gantungan Kunci Eksklusif",
        "Kipas Tangan Eksklusif",
        "2 buah Softdrink",
        "5 ticket gacha",
        "Totebage Eksklusif",
      ],
    ),
  ];
  int tabIndex = 0;
  int ticketAmount = 0;
  SexType? sex;

  void onAmountChanged(int amount) {
    ticketAmount = amount;
    update();
  }

  void onSexChanged(SexType data) {
    sex = data;
    update();
  }

  void decreaseAmount() {
    ticketAmount -= 1;
    update();
  }

  void increaseAmount() {
    ticketAmount += 1;
    update();
  }

  void onTabChanged(int index) {
    tabIndex = index;
    update();
  }
}
