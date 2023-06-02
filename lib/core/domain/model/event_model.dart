class Event {
  final String id;
  final String title;
  final double price;
  final DateTime dateTime;
  final String description;
  final String url;
  final String imageUrl;
  final EventVenue venue;
  final List<EventContact> contacts;
  final EventContact author;
  final List<EventTicket> tickets;

  Event({
    required this.id,
    required this.title,
    required this.price,
    required this.dateTime,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.venue,
    required this.contacts,
    required this.author,
    required this.tickets,
  });
}

class EventVenue {
  final String name;
  final String location;
  final String address;

  EventVenue({
    required this.name,
    required this.location,
    required this.address,
  });
}

class EventContact {
  final String id;
  final String? imageUrl;
  final String title;
  final String subtitle;

  EventContact({
    required this.id,
    this.imageUrl,
    required this.title,
    required this.subtitle,
  });
}

class EventAuthor {
  final String id;
  final String? imageUrl;
  final String title;
  final String subtitle;

  EventAuthor({
    required this.id,
    this.imageUrl,
    required this.title,
    required this.subtitle,
  });
}

class EventTicket {
  final String id;
  final String title;
  final int price;
  final int ticketsLeft;
  final List<String> benefits;

  EventTicket({
    required this.id,
    required this.title,
    required this.price,
    required this.ticketsLeft,
    required this.benefits,
  });
}
