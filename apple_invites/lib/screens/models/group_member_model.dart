import 'package:uuid/uuid.dart';

const uuid = Uuid();

class GroupMemberModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String? description;
  final String? imageUrl;
  final String? type; // if admin or not
  GroupMemberModel({
    required this.name,
    required this.email,
    required this.phone,
    this.description,
    this.imageUrl,
    this.type,
  }) : id = uuid.v4();
}
