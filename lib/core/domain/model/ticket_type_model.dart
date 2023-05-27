class TicketTypeModel {
  final String id;
  final String title;
  final int price;
  final int ticketsLeft;
  final List<String> benefits;

  TicketTypeModel({
    required this.id,
    required this.title,
    required this.price,
    required this.ticketsLeft,
    required this.benefits,
  });
}
