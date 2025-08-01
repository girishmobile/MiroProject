import 'package:uuid/uuid.dart';

const uuid = Uuid();

class NotificationModel {
  final String id;
  final String title;
  final String message;
  final DateTime date;

  NotificationModel({
    required this.title,
    required this.message,
    required this.date,
  }) : id = uuid.v4();
}
