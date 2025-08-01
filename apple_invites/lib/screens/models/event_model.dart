import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class EventModel {
  final String id;
  final String name;
  final String category;
  final String location;
  final String dateTime;
  final String imageUrl;
  final IconData? categoryIcon;
  final double? perTicket;
  final double? collected;
  final int? numberOfJoin;
  final bool host;
  final List<String>? chooseVenue;
  final int? totalVote;
  final VenuePoll? venuePoll;

  EventModel({
    required this.name,
    required this.category,
    required this.dateTime,
    required this.imageUrl,
    this.categoryIcon,
    required this.location,
    this.perTicket,
    this.collected,
    this.numberOfJoin,
    required this.host,
    this.totalVote,
    this.chooseVenue,
    this.venuePoll,
  }) : id = uuid.v4();
}

class VenuePoll {
  final String id;
  final String venueName;
  final int votes;
  VenuePoll({required this.venueName, required this.votes}) : id = uuid.v4();
}
