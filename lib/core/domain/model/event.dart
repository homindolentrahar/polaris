import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  final String id;
  final String title;
  @JsonKey(name: "date_time")
  final DateTime dateTime;
  final String description;
  final String url;
  @JsonKey(name: "image_url")
  final String imageUrl;
  final EventVenue venue;
  final List<EventContact> contacts;
  final EventAuthor author;
  final List<EventTicket> tickets;
  final EventAnalytics analytics;

  Event({
    required this.id,
    required this.title,
    required this.dateTime,
    required this.description,
    required this.url,
    required this.imageUrl,
    required this.venue,
    required this.contacts,
    required this.author,
    required this.tickets,
    required this.analytics,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}

@JsonSerializable()
class EventVenue {
  final String name;
  final String location;
  final String address;
  final int capacity;

  EventVenue({
    required this.name,
    required this.location,
    required this.address,
    required this.capacity,
  });

  factory EventVenue.fromJson(Map<String, dynamic> json) =>
      _$EventVenueFromJson(json);

  Map<String, dynamic> toJson() => _$EventVenueToJson(this);
}

@JsonSerializable()
class EventContact {
  final String id;
  @JsonKey(name: "image_url")
  final String? imageUrl;
  final String name;
  final String position;
  final String contact;

  EventContact({
    required this.id,
    this.imageUrl,
    required this.name,
    required this.position,
    required this.contact,
  });

  factory EventContact.fromJson(Map<String, dynamic> json) =>
      _$EventContactFromJson(json);

  Map<String, dynamic> toJson() => _$EventContactToJson(this);
}

@JsonSerializable()
class EventAuthor {
  final String id;
  @JsonKey(name: "image_url")
  final String? imageUrl;
  final String name;
  final String description;
  final String address;
  final String contact;

  EventAuthor({
    required this.id,
    this.imageUrl,
    required this.name,
    required this.description,
    required this.address,
    required this.contact,
  });

  factory EventAuthor.fromJson(Map<String, dynamic> json) =>
      _$EventAuthorFromJson(json);

  Map<String, dynamic> toJson() => _$EventAuthorToJson(this);
}

@JsonSerializable()
class EventTicket {
  final String id;
  final String title;
  final double price;
  final int amount;
  final List<String> benefits;

  EventTicket({
    required this.id,
    required this.title,
    required this.price,
    required this.amount,
    required this.benefits,
  });

  factory EventTicket.fromJson(Map<String, dynamic> json) =>
      _$EventTicketFromJson(json);

  Map<String, dynamic> toJson() => _$EventTicketToJson(this);
}

@JsonSerializable()
class EventAnalytics {
  final int clicks;
  final int views;
  final double ctr;

  EventAnalytics({
    required this.clicks,
    required this.views,
    required this.ctr,
  });

  factory EventAnalytics.fromJson(Map<String, dynamic> json) =>
      _$EventAnalyticsFromJson(json);

  Map<String, dynamic> toJson() => _$EventAnalyticsToJson(this);
}
