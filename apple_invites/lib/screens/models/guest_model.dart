import 'package:uuid/uuid.dart';

const uuid = Uuid();

class GuestModel {
  final String id;
  final String name;
  final String email;
  final String? imageUrl;
  final String? subTitle;
  final GuestStatus status;
  GuestModel({
    required this.name,
    required this.status,
    required this.email,
    this.imageUrl,
    this.subTitle,
  }) : id = uuid.v4();
}

enum GuestStatus { accepted, rejected }
